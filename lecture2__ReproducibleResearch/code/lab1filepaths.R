
workingFolder<-"/Users/simonray/uio_dropbox_sr/myTeaching/MF9155_2025/lecture2__ReproducibleResearch/data/"


## Getting Started
happyBunnyFile<-"test_bunny.txt"
happyBunnyFilePath<-file.path(workingFolder,happyBunnyFile)


## GC Calc
hairpinFileFA<-"hairpin.fa" # change this to the gc100 test file and reload
hairpinFileFAPath<-file.path(workingFolder,hairpinFileFA)


## miRNA Prediction
randomMiRs<-"50negmirs.tsv"
trainData<-"mirdata_train.tsv"
trainDataPath<-file.path(workingFolder,trainData)
testData<-"mirdata_test.tsv"
testDataPath<-file.path(workingFolder,testData)
test2Data<-"mirdata_test2.tsv"
test2DataPath<-file.path(workingFolder,test2Data)


# Sorting Data
sort1000BenchmarkFile<-"sort10000_benchmark.tsv"
sort1000BenchmarkFilePath<-file.path(workingFolder,sort1000BenchmarkFile)