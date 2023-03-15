package tests;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }

    @Karate.Test
    Karate testFeature() {
        return Karate.run("karateDemo.feature").relativeTo(getClass());
    }

    /*public static void generateReport(String karateOutputPath) {

        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "tests");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }*/
    /*@Karate.Test
    public void testParallel() {
        Results results = Runner.path("C:\\Users\\cevik\\IdeaProjects\\karateApiSample\\src\\test\\java\\tests")
                .tags("~@ignore").parallel(1);
        generateReport(results.getReportDir());
    }*/
}
