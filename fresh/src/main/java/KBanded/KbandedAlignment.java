/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package KBanded;

import static Accuracy.OriginalEditdistance.sortByValue;
import util.EditDistance;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/**
 *
 * @author azizmma
 */
public class KbandedAlignment {

//    public final static int kbandSize = 50;
    /**
     * @param args  args[0]: db file
     *              args[1]: query file
     *              args[2]: band width
     *              args[3]: output file
     */     
    public static void main(String[] args) throws FileNotFoundException, IOException {
        int kbandSize = Integer.parseInt(args[2]);
        int index = 0, indexQ = 0;
        Map<Integer, String> data = new HashMap<>();
        Map<Integer, Integer> distanceMap = new HashMap<>();

        Scanner sc2 = new Scanner(new File(args[1]));
        while (sc2.hasNext()) {
            String nextQ = sc2.nextLine();
            if (nextQ.contains(">")) {
                indexQ = Integer.parseInt(nextQ.replace(">", ""));
            } else {
                Scanner sc = new Scanner(new File(args[0]));
                while (sc.hasNext()) {
                    String next = sc.nextLine();
                    if (next.contains(">")) {
                        index = Integer.parseInt(next.replace(">", ""));
                    } else {
                        data.put(index, next);
                        distanceMap.put(index, EditDistance.getKbandEditDistance(nextQ, next, kbandSize));
                        if (index > 3000) {
                            break;
                        }
                        index = 0;
                    }
                }
                //System.out.println(distanceMap);
                distanceMap = sortByValue(distanceMap);
                int ind = 0, tmp = 99999;
                System.out.println("writing" + args[3]);
                PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter(args[3], false)));
                
                //System.out.println("distanceMap = " + distanceMap);

                for (Map.Entry<Integer, Integer> entrySet : distanceMap.entrySet()) {
                    if (tmp != entrySet.getValue()) {
                        ind++;
                    }
                    pw.println(ind + ":" + entrySet.getKey());
                    tmp = entrySet.getValue();
                }
                pw.flush();
                pw.close();
            }
        }
    }
}
