<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tour</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-lg border-0">
        <div class="card-header bg-primary text-white text-center py-3">
    <h2 class="mb-0 fw-bold">Add Tour</h2>
</div>

        <div class="card-body">
            <form action="TourAddServlet" method="post">
                
                <div class="mb-3">
                    <label class="form-label">TOURID:</label>
                    <input type="text" name="tourId" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">TOURNAME:</label>
                    <input type="text" name="tourName" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">STATE:</label>
                    <select name="state" class="form-select">
                        <option value="Meghalaya">Meghalaya</option>
                        <option value="Uttarakhand">Uttarakhand</option>
                        <option value="Kerala">Kerala</option>
                        <option value="Maharashtra">Maharashtra</option>
                        <option value="Himachal Pradesh">Himachal Pradesh</option>
                    </select>
                </div>

               <div class="mb-3">
    <label class="form-label">CITIES :</label>
    <select name="cities" class="form-select">
        <option value="meghalaya">
            Shillong, Cherrapunji, Tura, Jowai, Nongpoh (Meghalaya)
        </option>
        <option value="uttarakhand">
            Dehradun, Nainital, Mussoorie, Haridwar, Rishikesh (Uttarakhand)
        </option>
        <option value="kerela">
            Kochi, Thiruvananthapuram, Kozhikode, Munnar, Alappuzha (Kerala)
        </option>
        <option value="mumbai">
            Mumbai, Pune, Nagpur, Nashik, Aurangabad (Maharashtra)
        </option>
        <option value="himachal">
            Shimla, Manali, Dharamshala, Kullu, Solan (Himachal Pradesh)
        </option>
    </select>
</div>


                <div class="mb-3">
                    <label class="form-label">TRAVEL MODE:</label>
                    <select name="travelMode" class="form-select">
                        <option value="Bus">Bus</option>
                        <option value="Train">Train</option>
                        <option value="Flight">Flight</option>
                        <option value="Car">Car</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">ACCOMMODATION:</label>
                    <select name="accommodation" class="form-select">
                        <option value="Budget">Budget</option>
                        <option value="Standard">Standard</option>
                        <option value="Luxury">Luxury</option>
                    </select>
                </div>

               <div class="mb-3 row">
    <div class="col-md-6">
        <label class="form-label">START DATE:</label>
        <input type="date" name="startDate" class="form-control" required>
    </div>
    <div class="col-md-6">
        <label class="form-label">END DATE:</label>
        <input type="date" name="endDate" class="form-control" required>
    </div>
</div>


                <div class="mb-3">
                    <label class="form-label">PRICE:</label>
                    <input type="number" name="price" class="form-control" required>
                </div>

                <div class="text-center">
                    <input type="submit" value="ADD" class="btn btn-success px-4">
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
