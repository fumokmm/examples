package sample0001arraycast;

import java.util.Arrays;

public class Main {
    public static void main(String... args) {
        Object[] objArray = new Object[]{
            "aaa", "bbb", "ccc"
        };

        // String[] strArray = (String[]) objArray; ← コンパイルエラー
        // 一階リストにしてから配列にキャストすれば大丈夫
        String[] strArray = Arrays.asList(objArray).toArray(new String[objArray.length]);
        
        for (String str : strArray) {
            System.out.println(str);
        }
    }
}