package master.dto;

public class HotelDto {
    private String hotelId;    // String type
    private String hotelName;  // String type  
    private String tplace;     // String type
    
    // Fix this constructor - it needs to set the fields!
    public HotelDto(int i, String name, String place) {
        this.hotelId = String.valueOf(i);  // Convert int to String
        this.hotelName = name;
        this.tplace = place;
    }
    
    // Constructor with String parameters
    public HotelDto(String i, String hotelName, String tplace) {
        this.hotelId = i;
        this.hotelName = hotelName;
        this.tplace = tplace;
    }
    
    // Getter for hotelId
    public String getHotelId() {
        return hotelId;
    }
    
    // Setter for hotelId
    public void setHotelId(String hotelId) {
        this.hotelId = hotelId;
    }
    
    // Getter for hotelName
    public String getHotelName() {
        return hotelName;
    }
    
    // Setter for hotelName
    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }
    
    // Getter for tplace
    public String getTplace() {
        return tplace;
    }
    
    // Setter for tplace
    public void setTplace(String tplace) {
        this.tplace = tplace;
    }
}

