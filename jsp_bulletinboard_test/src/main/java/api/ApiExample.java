package api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class ApiExample {

    public static void main(String[] args) {
        String apiKey = "ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D"; // 인증키
        String apiUrl = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/sido";

        try {
            String queryParams = "?ServiceKey=" + URLEncoder.encode(apiKey, "UTF-8")
                    + "&care_reg_no=&care_nm=&numOfRows=3&pageNo=1&_type=json"; // 요청 변수 추가

            URL url = new URL(apiUrl + queryParams);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line;
            StringBuilder response = new StringBuilder();

            while ((line = reader.readLine()) != null) {
                response.append(line);
            }

            reader.close();
            connection.disconnect();

            String responseData = response.toString();
            System.out.println(responseData); // API 데이터 출력

            // 여기에 JSON 라이브러리를 사용하여 JSON 데이터 파싱 및 가공 코드를 추가하세요.
            // 예를 들어, Gson이나 Jackson 라이브러리를 사용하여 처리 가능합니다.

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}