echo "Cleaning up existing hadoop directories .."

echo "Compiling the java classes .."
cd /home/dheeraj/Desktop/HadoopApriori-master/src/apriori

javac -classpath /home/hduser/hadoop/hadoop-core-0.20.1.jar -d ../../classes/ MRApriori.java ../model/Transaction.java ../model/ItemSet.java ../model/HashTreeNode.java ../utils/AprioriUtils.java ../utils/HashTreeUtils.java

echo "Creating the jar .."
jar -cvf ../../jars/mrapriori.jar -C ../../classes/ .

echo "Launching the hadoop job .."
cd ../../jars;
hadoop jar mrapriori.jar apriori.MRApriori /user/hduser/mrapriori-T10I4D100K /user/hduser/mrapriori-out- 4 0.75 98395
