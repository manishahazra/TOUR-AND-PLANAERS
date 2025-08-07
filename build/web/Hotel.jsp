
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotels</title>
    <style>
        .container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); 
            grid-gap: 30px;
            margin-top: 30px;
            border-radius: 10px;
            padding: 20px;
        }
        
        .hotel {
            border: 1px solid #ccc;
            padding: 20px;
            text-align: center;
            border-radius: 10px;
            background-color: white; 	
        }

        .hotel-image {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
            border-radius: 10px;
        }

        .hotel-name {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        .button {
            cursor: pointer;
            text-decoration: none;
            color: white;
            background-color: #28a745;
            padding: 10px 20px;
            border-radius: 5px;
            display: inline-block;
            margin-top: 10px;
            width: calc(50% - 10px);
            box-sizing: border-box;
        }

        .button:hover {
            background-color: #218838;
        }

        .phone-number {
            background-color: #007bff;
        }

        .phone-number:hover {
            background-color: #0056b3;
        }

        p {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
            color: blue;
            border-radius: 10px;
        }

        body {
            background-color: #00b7ac;
        }

        .excellence-info {
            margin: 20px; 
            padding: 10px; 
            background-color: #f0f0f0; 
            border: 1px solid #ccc; 
            border-radius: 5px; 
        }

        .excellence-info ul li {
            margin-bottom: 10px;  
            font-size: 16px; 
            line-height: 1.6; 
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
            background-color: grey; 
            padding: 5px 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .hotel img {
            width: 250px;
            height: 60%;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .hotel img:hover {
            transform: scale(1.05);
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 20px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo img {
            height: 50px;
            width: auto;
        }

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        nav ul li {
            display: inline;
            margin-right: 20px;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
            background-color: grey;
            padding: 5px 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        nav ul li a:hover {
            background-color: #555;
        }

        .content {
            padding: 20px;
        }

        .search-container {
            margin: 20px;
            text-align: center;
        }

        .search-box {
            width: 300px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: box-shadow 0.3s ease;
        }

        .search-box:focus {
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            outline: none;
        }
    </style>
</head>
<body>
<header>
     <div class="logo">
	    
            <img src="puri12.jpg" alt="Logo">
            <img src="puri13.jpeg" alt="Logo">
            <img src="puri14.jpg" alt="Logo">
            <img src="puri15.jpeg" alt="Logo">
            <img src="puri16.jpeg" alt="Logo">
            <img src="puri17.jpg" alt="Logo">
            <img src="puri18.jpg" alt="Logo">
            <img src="d19.jpg" alt="Logo">
            <img src="d20.jpg" alt="Logo">
            <img src="d21.jpg" alt="Logo">
            <img src="d22.jpg" alt="Logo">
            <img src="d23.jpg" alt="Logo">
            <img src="d24.jpg" alt="Logo">
            <img src="d25.jpg" alt="Logo">
            <img src="d26.jpg" alt="Logo">
            <img src="d27.jpg" alt="Logo">
            <img src="d28.jpg" alt="Logo">
            <img src="d29.jpg" alt="Logo">
            <img src="d30.jpg" alt="Logo">
            <img src="d31.jpg" alt="Logo">
            <img src="d32.jpg" alt="Logo">
            <img src="d33.jpg" alt="Logo">
            
            
	    
	</div>
    
</header>

<br><br><br><h2 id="in">Excellence of our Hotels</h2>

<div class="excellence-info">
    <ul>
        <li>Lodging and often food/beverage: Primarily offers sleeping accommodation and may include dining facilities, restaurants, bars, etc.
        <li>Target Audience: Caters to tourists and travelers, whether domestic or international.</li>
        <li>Amenities and Services: May offer a range of amenities like recreation, entertainment, meeting facilities, laundry services, and more, depending on the hotel's classification and target market.
        <li>Economic Impact: Plays a significant role in local and national economies by generating revenue, creating employment opportunities, and contributing to infrastructure development.
        <li>Examples: Tourism hotels can vary widely, from budget-friendly options to luxurious resorts or boutique hotels with unique characteristics. </li>
        <li>It's important to note that the specific definition and classification of a tourism hotel can vary slightly depending on the source or regional regulations. For example, some sources may specify a minimum number of bedrooms or particular amenities required to be classified as a tourist hotel. 
        <li>Low rates in complex medical procedures.
        <li>Commitment to continuous improvement and quality assurance.
        <li>Positive customers outcomes and satisfaction ratings.</li>
        </ul>
</div>

<div class="search-container">
    <input type="text" id="search-box" class="search-box" placeholder="Search for a Hotels.........">
</div>

<div class="container" id="hotel-list">
    <div class="hotel">
        <img src="k1.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Kullu Manali Hotel</p>
        <a href="tel:8967435291" class="button phone-number">8967435291</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
    
    <div class="hotel">
        <img src="k2.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotel Snow Park  Manali</p>
        <a href="tel:8964532187" class="button phone-number">8964532187</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
    
    <div class="hotel">
        <img src="k3.jpg" alt="image" class="hotel-image">
        <p class="hotel-name"> Shimla Hotel </p>
        <a href="tel:7845361583" class="button phone-number">7845361583</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
    <div class="hotel">
        <img src="k4.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Homestays over high-end hotels in Himachal Pradesh</p>
        <a href="tel:8697231646" class="button phone-number">8697231646</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
    <div class="hotel">
        <img src="k5.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Bravia Hotel , Manali </p>
        <a href="tel:9854369142" class="button phone-number">9854369142</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
    <div class="hotel">
        <img src="k6.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotels Near Himshell Expedition and Hidden Orchads Himachal Pradesh</p>
        <a href="tel:9827613508" class="button phone-number">9827613508</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
    <div class="hotel">
        <img src="kashmir22.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Radisson Hotel, Srinagar </p>
        <a href="tel:9785370167" class="button phone-number">9785370167</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
    <div class="hotel">
        <img src="kashmir33.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Lalit Grand Place</p>
        <a href="tel:7865405432" class="button phone-number">7865405432</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
    <div class="hotel">
        <img src="kashmir44.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotels in Kashmir</p>
        <a href="tel:7843209862" class="button phone-number">7843209862</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
    <div class="hotel">
        <img src="kashmir5.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Srinagar Hotel </p>
        <a href="tel:9805647142" class="button phone-number">9805647142</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
    <div class="hotel">
        <img src="kashmir6.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Grand Plaza Lords Inn, Jammu</p>
        <a href="tel:9832174390" class="button phone-number">9832174390</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
    <div class="hotel">
        <img src="kashmir7.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">The Lalit Grand Place Srinagar</p>
        <a href="tel:8972057487" class="button phone-number">8972057487</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
    <div class="hotel">
        <img src="puri.jpeg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotel Puri</p>
        <a href="tel:8763459210" class="button phone-number">8763459210</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
    <div class="hotel">
        <img src="puri1.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotel Puri Beach Resort(Odisha)</p>
        <a href="tel:9977564543" class="button phone-number">9977564543</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
    <div class="hotel">
        <img src="puri11.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Goroomgo Park Puri</p>
        <a href="tel:9976328064" class="button phone-number">9976328064</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
    <div class="hotel">
        <img src="puri12.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotel Tara Place</p>
        <a href="tel:7829410437" class="button phone-number">7829410437</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
    <div class="hotel">
        <img src="puri13.jpeg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotel New Malancha,Puri</p>
        <a href="tel:9832156707" class="button phone-number">9832156707</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
    <div class="hotel">
        <img src="puri14.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Pramod Convention & Beach Resort Puri</p>
        <a href="tel:9804568372" class="button phone-number">9804568372</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="puri15.jpeg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotel San Sebastian  Puri</p>
        <a href="tel:9837568734" class="button phone-number">9837568734</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="puri16.jpeg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotels Puri</p>
        <a href="tel:9873461854" class="button phone-number">9873461854</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="puri17.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotel Niladri Puri</p>
        <a href="tel:7845690371" class="button phone-number">7845690371</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="puri18.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Nayak Group of Hotel  Puri</p>
        <a href="tel:7834504968" class="button phone-number">7834504968</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="puri2.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotel Prabhupada Puri</p>
        <a href="tel:995643068" class="button phone-number">995643068</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="s1.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Swimsea Beach Resort Panaji, Goa</p>
        <a href="tel:785409284" class="button phone-number">785409284</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="s2.jpeg" alt="image" class="hotel-image">
        <p class="hotel-name">Ocean Beach Hotel  California</p>
        <a href="tel:9967335495" class="button phone-number">9967335495</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="s2.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotel Resort</p>
        <a href="tel:7843978057" class="button phone-number">7843978057</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="s3.jpeg" alt="image" class="hotel-image">
        <p class="hotel-name">Swim Sea Beach Resort Hotel,Goa</p>
        <a href="tel:8854087616" class="button phone-number">8854087616</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="s3.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Resort Hotel </p>
        <a href="tel:9847259075" class="button phone-number">9847259075</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="s4.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Jack Payne and Kate Kobosko?s</p>
        <a href="tel:8943762180" class="button phone-number">8943762180</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="s5.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Sandals Royals Bahamian Canada</p>
        <a href="tel:9834757074" class="button phone-number">9834757074</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="s6.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Atlantic Avenue Daytona Beach</p>
        <a href="tel:9845068724" class="button phone-number">9845068724</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d19.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotel Manager</p>
        <a href="tel:9847395638" class="button phone-number">9847395638</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d20.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">RIVA New Digha Hotel in Kanthil</p>
        <a href="tel:9968754318" class="button phone-number">9968754318</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d21.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotel Dolphin (Digha, WestBengal) </p>
        <a href="tel:8965440425" class="button phone-number">8965440425</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d22.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Family hotels in Digha</p>
        <a href="tel:9860834758" class="button phone-number">9860834758</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d23.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Gogol Beach Resort  Mandarmoni</p>
        <a href="tel:7690834638" class="button phone-number">7690834638</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d24.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Resorts in Shankarpur</p>
        <a href="tel:9845376057" class="button phone-number">9845376057</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d25.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotel Asha Digha</p>
        <a href="tel:9057838489" class="button phone-number">9057838489</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d26.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">New Digha Sree Market,Digha</p>
        <a href="tel:8934210639" class="button phone-number">8934210639</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d27.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotel Holiday Home ,Digha</p>
        <a href="tel:784301286" class="button phone-number">784301286</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d28.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotel Digha</p>
        <a href="tel:9837634827" class="button phone-number">9837634827</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d29.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Collection O Resort k Sea , Digha</p>
        <a href="tel:8954307432" class="button phone-number">8954307432</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d30.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Sagar Priya Hotel , Digha</p>
        <a href="tel:9946872315" class="button phone-number">9946872315</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d31.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Super Capital O Bidisha Hotel , Digha</p>
        <a href="tel:9587623492" class="button phone-number">9587623492</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d32.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Forest resorts, Kolkata </p>
        <a href="tel:9847652047" class="button phone-number">9847652047</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d33.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">3 star Resorts in Bidhan Nagar Ga Block, Kolkata</p>
        <a href="tel:9847215907" class="button phone-number">9847215907</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d34.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Pride Biznotel Canopus, Digha</p>
        <a href="tel:9836127605" class="button phone-number">9836127605</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d35.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotel Prashant Jahaz Bari New Digha</p>
        <a href="tel:9865721305" class="button phone-number">9865721305</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d36.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotel Nilachal Puri</p>
        <a href="tel:9847237057" class="button phone-number">9847237057</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
<div class="hotel">
        <img src="d37.jpg" alt="image" class="hotel-image">
        <p class="hotel-name">Hotel Niladri</p>
        <a href="tel:9845286728" class="button phone-number">9845286728</a>
        <a href="book_hotel.html" class="button">Booking Now</a>
    </div>
</div>

<script>
    function makeCall(phoneNumber) {
        window.location.href = 'tel:' + phoneNumber;
    }

    document.getElementById('search-box').addEventListener('input', function() {
        let filter = this.value.toUpperCase();
        let hotel = document.getElementsByClassName('hotel');

        for (let i = 0; i < hotel.length; i++) {
            let p = hotel[i].getElementsByClassName('hotel-name')[0];
            if (p.innerHTML.toUpperCase().indexOf(filter) > -1) {
                hotel[i].style.display = '';
            } else {
                hotel[i].style.display = 'none';
            }
        }
    });
</script>
</body>
</html>
