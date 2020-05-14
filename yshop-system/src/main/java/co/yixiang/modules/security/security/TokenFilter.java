/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.security.security;

import co.yixiang.modules.security.config.SecurityProperties;
import co.yixiang.modules.security.service.OnlineUserService;
import io.jsonwebtoken.ExpiredJwtException;
import lombok.extern.slf4j.Slf4j;
import co.yixiang.modules.security.security.vo.OnlineUser;
import co.yixiang.utils.SpringContextHolder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.GenericFilterBean;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @author /
 */
@Slf4j
public class TokenFilter extends GenericFilterBean {

   private final TokenProvider tokenProvider;

   TokenFilter(TokenProvider tokenProvider) {
      this.tokenProvider = tokenProvider;
   }

   @Override
   public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
      throws IOException, ServletException {
      HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
      String token = resolveToken(httpServletRequest);
      String requestRri = httpServletRequest.getRequestURI();
      // 验证 token 是否存在
      OnlineUser onlineUser = null;
      try {
         SecurityProperties properties = SpringContextHolder.getBean(SecurityProperties.class);
         OnlineUserService onlineUserService = SpringContextHolder.getBean(OnlineUserService.class);
         onlineUser = onlineUserService.getOne(properties.getOnlineKey() + token);
      } catch (ExpiredJwtException e) {
         log.error(e.getMessage());
      }
      if (onlineUser != null && StringUtils.hasText(token) && tokenProvider.validateToken(token)) {
         Authentication authentication = tokenProvider.getAuthentication(token);
         SecurityContextHolder.getContext().setAuthentication(authentication);
         log.debug("set Authentication to security context for '{}', uri: {}", authentication.getName(), requestRri);
      } else {
         log.debug("no valid JWT token found, uri: {}", requestRri);
      }
      filterChain.doFilter(servletRequest, servletResponse);
   }

   private String resolveToken(HttpServletRequest request) {
      SecurityProperties properties = SpringContextHolder.getBean(SecurityProperties.class);
      String bearerToken = request.getHeader(properties.getHeader());
      if (StringUtils.hasText(bearerToken) && bearerToken.startsWith(properties.getTokenStartWith())) {
         return bearerToken.substring(7);
      }
      return null;
   }
}
