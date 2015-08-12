package aa.tp2;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

import weka.classifiers.Classifier;
import weka.core.Instances;

public class Run {

	public static void main(String[] args) throws Exception {

		 Classifier classifier = (Classifier) weka.core.SerializationHelper.read("best_model.model");
		 
		Instances unlabeled = new Instances(new BufferedReader(new FileReader("input.arff")));
		unlabeled.setClassIndex(unlabeled.numAttributes() - 1);

		Instances labeled = new Instances(unlabeled);

		for (int i = 0; i < unlabeled.numInstances(); i++) {
			double clsLabel = classifier.classifyInstance(unlabeled.instance(i));
			labeled.instance(i).setClassValue(clsLabel);
		}

		BufferedWriter writer = new BufferedWriter(new FileWriter("output.arff"));
		writer.write(labeled.toString());
		writer.newLine();
		writer.flush();
		writer.close();
	}
}