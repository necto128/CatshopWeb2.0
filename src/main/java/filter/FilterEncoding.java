package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "FilterEncoding")
public class FilterEncoding implements Filter {
    private String encoding;
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        if (null == req.getCharacterEncoding()) {
            req.setCharacterEncoding(encoding);
        }
        resp.setContentType("text/html; charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {
// читаем из конфигурации
        encoding = config.getInitParameter("requestEncoding");

        // если не установлена — устанавливаем UTF-8
        if (encoding == null) encoding = "UTF-8";
    }

}
