package FileManage;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Dataprocessing {
	
	
	public void linuxstart(String reid,String Processvalue1, String Processvalue2) {
       ProcessBuilder processBuilder = new ProcessBuilder();
    	String reid1 = reid.substring(0, 4);
    	System.out.println("datapro");
    	if (Processvalue1.equals("1")) {
    		System.out.println("sc");
       //SC
    	//processBuilder.command("bash", "-c", "FSLDIR=/usr/local/fsl&&. ${FSLDIR}/etc/fslconf/fsl.sh&&PATH=${FSLDIR}/bin:${PATH}&&export FSLDIR PATH&& export PATH=$PATH:/usr/local/MATLAB/R2019b/bin&&export MATLAB_USE_USERPATH=1&&export MRI_PREPROCESSING_BIN=/home/osh0510/Downloads/mri_preprocessing/src/&&export MRI_PREPROCESSING_HOME=/home/osh0510/Downloads/mri_preprocessing/&&export PATH=$PATH:${MRI_PREPROCESSING_BIN}&&cd /home/osh0510/Downloads/mri_preprocessing/src && echo $PATH &&rsfmri_preprocessing_exe /home/osh0510/Downloads/Uploadimages/"+reid1+"_t1.nii.gz /home/osh0510/Downloads/Uploadimages/"+reid1+"_fmri.nii.gz /home/osh0510/Downloads/images/"+reid1+" /home/osh0510/Downloads/mri_preprocessing/cnf/asan_nsfmri.cnf > /home/osh0510/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/saf/logtxt/"+reid1+"_log.txt");
    	      	
    	}
    	
    	if (Processvalue2.equals("1")) {
    	//FC
    		System.out.println("fc");
    	}

		if (Processvalue1.equals("1")&& Processvalue2.equals("1") ) {
			System.out.println("all");
		}
    	
    	
    	
    	System.out.println(reid1);
       // Run this on Windows, cmd, /c = terminate after this run
    	//processBuilder.command("bash", "-c", "cd /home/osh0510/Downloads/mri_preprocessing/src && ls");
      //processBuilder.command("bash", "-c", "FSLDIR=/usr/local/fsl&&. ${FSLDIR}/etc/fslconf/fsl.sh&&PATH=${FSLDIR}/bin:${PATH}&&export FSLDIR PATH&& export PATH=$PATH:/usr/local/MATLAB/R2019b/bin&&export MATLAB_USE_USERPATH=1&&export MRI_PREPROCESSING_BIN=/home/osh0510/Downloads/mri_preprocessing/src/&&export MRI_PREPROCESSING_HOME=/home/osh0510/Downloads/mri_preprocessing/&&export PATH=$PATH:${MRI_PREPROCESSING_BIN}&&cd /home/osh0510/Downloads/mri_preprocessing/src && echo $PATH &&rsfmri_preprocessing_exe /home/osh0510/Downloads/Uploadimages/"+reid1+"_t1.nii.gz /home/osh0510/Downloads/Uploadimages/"+reid1+"_fmri.nii.gz /home/osh0510/Downloads/images/"+reid1+" /home/osh0510/Downloads/mri_preprocessing/cnf/asan_nsfmri.cnf > /home/osh0510/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/saf/logtxt/"+reid1+"_log.txt");
        
        try {

            Process process = processBuilder.start();

			// blocked :(
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));

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