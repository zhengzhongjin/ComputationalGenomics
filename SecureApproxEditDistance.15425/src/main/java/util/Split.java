//
// Split a fa file into several parts
//

package util;
import java.io.*;
import java.util.Scanner;

public class Split {
    // arg[0] : input file
    // arg[1] : output file prefix
    public static void main(String args[]) throws FileNotFoundException, IOException {
        Scanner inputScanner = new Scanner(new File(args[0]));
        int index = 0;
        int ctr = 0;
        PrintWriter pw = null;

        while (inputScanner.hasNext()) {
            String next = inputScanner.nextLine();
            if (next.contains(">")) {
                index = Integer.parseInt(next.replace(">", ""));
                pw = new PrintWriter(new BufferedWriter(new FileWriter(args[1] + "_" + ctr, false)));
                pw.println(next);
                ctr++;
            } else {
                pw.println(next);
                pw.flush();
                pw.close();
            }
        }
        inputScanner.close();
    }
}