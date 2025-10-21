package master.utilities;

import jakarta.servlet.http.HttpServletRequestWrapper;

public class CustomRequestWrapper extends HttpServletRequestWrapper {
    
    public CustomRequestWrapper(HttpServletRequestWrapper request) {
        super(request);
    }
    
    public String getParameterSafely(String paramName) {
        String value = getParameter(paramName);
        return (value != null) ? value.trim() : "";
    }
    
    // Add your custom methods here
}
