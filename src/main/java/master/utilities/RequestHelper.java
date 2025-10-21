package master.utilities;

import jakarta.servlet.http.HttpServletRequest;

public class RequestHelper {
    
    public static String getParameterSafely(HttpServletRequest request, String paramName) {
        String value = request.getParameter(paramName);
        return (value != null) ? value.trim() : "";
    }
    
    public static boolean hasParameter(HttpServletRequest request, String paramName) {
        return request.getParameter(paramName) != null && 
               !request.getParameter(paramName).trim().isEmpty();
    }
    
    public static boolean isValidEmail(String email) {
        return email != null && email.matches("^[A-Za-z0-9+_.-]+@(.+)$");
    }
    
    public static boolean isValidPhone(String phone) {
        return phone != null && phone.matches("^[0-9]{10}$");
    }
}
