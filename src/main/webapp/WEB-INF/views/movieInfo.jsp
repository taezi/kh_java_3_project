<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${movie.movieName} - 상세 정보</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .detail-container {
            max-width: 1000px;
            margin: 60px auto;
            background-color: white;
            padding: 40px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            display: flex;
            gap: 40px;
            border-radius: 12px;
        }

        .poster {
            flex: 1;
        }

        .poster img {
            width: 100%;
            max-width: 320px;
            border-radius: 10px;
        }

        .info {
            flex: 2;
        }

        .info h1 {
            font-size: 32px;
            margin-bottom: 10px;
        }

        .info .sub {
            font-size: 16px;
            color: #777;
            margin-bottom: 20px;
        }

        .info p {
            font-size: 18px;
            line-height: 1.6;
            margin: 8px 0;
        }

        .info .highlight {
            font-weight: bold;
        }

        .description {
            margin-top: 20px;
            font-size: 16px;
            color: #444;
        }

        .popularity {
            margin-top: 12px;
            font-size: 15px;
            color: #999;
        }
    </style>
</head>
<body>
    <jsp:include page="./template/header.jsp" />

    <div class="detail-container">
        <div class="poster">
            <img src="https://image.tmdb.org/t/p/w500${movie.hposter}" alt="${movie.movieName}">
        </div>

        <div class="info">
            <h1>${movie.movieName}</h1>
            <div class="sub">
                ${movie.openDt} 개봉 · ${movie.gradeNm}
            </div>
            <p><span class="highlight">장르:</span> ${movie.repGenreNm}</p>
            <div class="description">
                <span class="highlight">줄거리:</span> <br>
                ${movie.descriptions}
            </div>
            <div class="popularity">
                🔥 인기 지수: ${movie.popularity}
            </div>
        </div>
    </div>
</body>
</html>
