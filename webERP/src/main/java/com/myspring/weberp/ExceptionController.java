/*
 * package com.myspring.weberp;
 * 
 * import org.slf4j.Logger; import org.slf4j.LoggerFactory; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.ControllerAdvice; import
 * org.springframework.web.bind.annotation.ExceptionHandler;
 * 
 * @ControllerAdvice
 * 
 * public class ExceptionController{
 * 
 * private static final Logger logger =
 * LoggerFactory.getLogger(ExceptionController.class);
 * 
 * @ExceptionHandler(javax.servlet.ServletException.class)
 * 
 * public String errorException(Model model, Exception e) {
 * 
 * logger.info("@ControllerAdvice 방식 \n###exeption : " +
 * e.getMessage()+"....된다...");
 * 
 * model.addAttribute("exception", e);
 * 
 * return "error/exception";
 * 
 * }
 * 
 * 
 * }
 */