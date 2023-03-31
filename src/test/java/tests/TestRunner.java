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

    @Karate.Test
    Karate testTags() {
        return Karate.run("01TestKarateApi.feature").tags("@test01").relativeTo(getClass());
        // mvn clean test -Dtest="TestRunner#testTags"
    }
}
