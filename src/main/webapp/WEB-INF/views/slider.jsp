<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Card Carousel</title>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <style>

body {
  font-family: 'Quicksand', sans-serif;
  background-color: #f0f0f0;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  margin: 0;
}

.carousel {
  width: 60%;
  overflow: hidden;
  position: relative;
}

.slide {
  display: flex;
  transition: transform 0.5s ease-in-out;
}

.item {
  display: flex;
  justify-content: space-between;
  min-width: 100%;
}

.card-group {
  display: flex;
  justify-content: space-between;
  width: 100%;
}

.card {
  background-color: #fff;
  padding: 20px;
  border-radius: 8px;
  display: flex;
  align-items: center;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  flex: 1;
  margin: 0 10px;
  width: 90px;
}

.card-img {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  margin-right: 20px;
}

.card-desc {
  flex: 1;
}

button {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  background-color: #027AA8;
  color: #fff;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
  z-index: 10;
}

button:hover{
  background-color:  #015f85;
}

button.prev {
  left: 10px;
}

button.next {
  right: 10px;
}


      </style>

</head>
<body>
    <div class="carousel">
        <button class="prev">&lt;</button>
        <div class="slide">
            <!-- Each group will have a class of 'item' -->
            <div class="item">
                <!-- Card Group 1 -->
                <div class="card-group">
                    <div class="card">
                        <img src="image1.jpg" alt="Image 1" class="card-img">
                        <div class="card-desc">Description 1</div>
                    </div>
                    <div class="card">
                        <img src="image2.jpg" alt="Image 2" class="card-img">
                        <div class="card-desc">Description 2</div>
                    </div>
                    <div class="card">
                        <img src="image3.jpg" alt="Image 3" class="card-img">
                        <div class="card-desc">Description 3</div>
                    </div>
                </div>
            </div>
            <div class="item">
                <!-- Card Group 2 -->
                <div class="card-group">
                    <div class="card">
                        <img src="image4.jpg" alt="Image 4" class="card-img">
                        <div class="card-desc">Description 4</div>
                    </div>
                    <div class="card">
                        <img src="image5.jpg" alt="Image 5" class="card-img">
                        <div class="card-desc">Description 5</div>
                    </div>
                    <div class="card">
                        <img src="image6.jpg" alt="Image 6" class="card-img">
                        <div class="card-desc">Description 6</div>
                    </div>
                </div>
            </div>
            <!-- Add more card groups as needed up to 6 groups -->
        </div>
        <button class="next">&gt;</button>
    </div>

    <script>
        let next = document.querySelector(".next");
        let prev = document.querySelector(".prev");

        next.addEventListener("click", function () {
            let items = document.querySelectorAll(".item");
            document.querySelector(".slide").appendChild(items[0]);
        });

        prev.addEventListener("click", function () {
            let items = document.querySelectorAll(".item");
            document.querySelector(".slide").prepend(items[items.length - 1]);
        });
    </script>
</body>
</html>
