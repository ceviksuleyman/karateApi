import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class CucumberReporting {

    @Test
    public void testAll() { //mvn clean test -Dtest="CucumberReporting#testAll"
        Results results = Runner.path("classpath:features")
                .outputCucumberJson(true)
                .parallel(0);
        generateReport(results.getReportDir());
    }

    @Test
    public void testParallel() { //mvn clean test -Dtest="CucumberReporting#testParallel"
        Results results = Runner.path("classpath:features")
                .outputCucumberJson(true)
                .parallel(1);

        generateReport(results.getReportDir());

        Assertions.assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    @Test
    public void testTags() { //mvn clean test -Dtest="CucumberReporting#testTags"
        Results results = Runner.path("classpath:features/testGet.feature")
                .tags("@getDemo4")
                .outputCucumberJson(true)
                .parallel(0);
        generateReport(results.getReportDir());
    }

    public static void generateReport(String karateOutputPath) {

        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "karateAPI");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
