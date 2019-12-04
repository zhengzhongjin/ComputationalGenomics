//
// Split a fa file into several parts

package util;

import java.io.*;
import java.util.Scanner;

public class Merge {
    // args[0] : input file prefix
    // args[1] : l
    // args[2] : r
    // args[3] : output file

    public static void main(String args[]) throws FileNotFoundException, IOException {
        int left = Integer.parseInt(args[1]);
        int right = Integer.parseInt(args[2]);

        PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter(args[3], false)));

        for (int i = left;i < right;i++) {
            Scanner inputScanner = new Scanner(new File(args[0] + "_" + i));
            while (inputScanner.hasNext()) {
                pw.println(inputScanner.nextLine());
            }    
            inputScanner.close();
        }

        pw.flush();
        pw.close();
    }
}