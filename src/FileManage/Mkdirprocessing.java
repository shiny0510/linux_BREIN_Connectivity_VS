package FileManage;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Mkdirprocessing {
	public void linuxstart(String reid, String projectname) {
       ProcessBuilder processBuilder = new ProcessBuilder();
    	
        // Run this on Windows, cmd, /c = terminate after this run
        processBuilder.command("bash", "-c", "mkdir -p /home/osh0510/WebDatabase/"+reid+"/"+projectname+"/matrix");
        try {

            Process process = processBuilder.start();

			// blocked :(
            BufferedReader reader =
                    new BufferedReader(new InputStreamReader(process.getInputStream()));

            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }

            int exitCode = process.waitFor();
            System.out.println("\nExited with error code : " + exitCode);

        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
	}

	public static void main(String[] args) {


    }
}