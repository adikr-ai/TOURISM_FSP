package master.dto;


public class AllotmentDto {
    private String tourId;
    private String hotelId;

    public AllotmentDto() {}

    public AllotmentDto(String tourId, String hotelId) {
        this.tourId = tourId;
        this.hotelId = hotelId;
    }

    public String getTourId() {
        return tourId;
    }

    public void setTourId(String tourId) {
        this.tourId = tourId;
    }

    public String getHotelId() {
        return hotelId;
    }

    public void setHotelId(String hotelId) {
        this.hotelId = hotelId;
    }
}
