package master.dto;

import java.math.BigDecimal;
import java.sql.Date;

public class TourDTO {
    private String tourId;
    private String tourName;
    private String state;
    private String cities;
    private String travelMode;
    private String accommodation;
    private Date startDate;
    private Date endDate;
    private BigDecimal price;

    // Getters and Setters
    public String getTourId() { return tourId; }
    public void setTourId(String tourId) { this.tourId = tourId; }

    public String getTourName() { return tourName; }
    public void setTourName(String tourName) { this.tourName = tourName; }

    public String getState() { return state; }
    public void setState(String state) { this.state = state; }

    public String getCities() { return cities; }
    public void setCities(String cities) { this.cities = cities; }

    public String getTravelMode() { return travelMode; }
    public void setTravelMode(String travelMode) { this.travelMode = travelMode; }

    public String getAccommodation() { return accommodation; }
    public void setAccommodation(String accommodation) { this.accommodation = accommodation; }

    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }

    public Date getEndDate() { return endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }
}
