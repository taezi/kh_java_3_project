package vo;

import java.util.Map;

public class RepGenreNmVO {
    private static final Map<String, String> genreMap = Map.ofEntries(
            Map.entry("28", "액션"),
            Map.entry("12", "모험"),
            Map.entry("16", "애니메이션"),
            Map.entry("35", "코미디"),
            Map.entry("80", "범죄"),
            Map.entry("99", "다큐멘터리"),
            Map.entry("18", "드라마"),
            Map.entry("10751", "가족"),
            Map.entry("14", "판타지"),
            Map.entry("36", "역사"),
            Map.entry("27", "공포"),
            Map.entry("10402", "음악"),
            Map.entry("9648", "미스터리"),
            Map.entry("10749", "로맨스"),
            Map.entry("878", "SF"),
            Map.entry("10770", "TV 영화"),
            Map.entry("53", "스릴러"),
            Map.entry("10752", "전쟁"),
            Map.entry("37", "웨스턴")
        );

        public static String getGenreName(String code) {
            return genreMap.getOrDefault(code, "기타");
        }
        
        public static String convertGenreCodes(String codes) {
            if (codes == null || codes.isEmpty()) return "기타";

            // 대괄호 제거하고 ,로 분리
            String[] codeArr = codes.replaceAll("\\[|\\]", "").split(",");

            StringBuilder result = new StringBuilder();
            for (int i = 0; i < codeArr.length; i++) {
                String genre = RepGenreNmVO.getGenreName(codeArr[i].trim());
                result.append(genre);
                if (i < codeArr.length - 1) {
                    result.append(", ");
                }
            }
            return result.toString();
        }
}
