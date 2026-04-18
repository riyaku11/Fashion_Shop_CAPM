sap.ui.define([
    "sap/ui/test/opaQunit",
    "./pages/JourneyRunner"
], function (opaTest, runner) {
    "use strict";

    function journey() {
        QUnit.module("First journey");

        opaTest("Start application", function (Given, When, Then) {
            Given.iStartMyApp();

            Then.onTheFashion_ItemsList.iSeeThisPage();
            Then.onTheFashion_ItemsList.onFilterBar().iCheckFilterField("Fashion Type");
            Then.onTheFashion_ItemsList.onFilterBar().iCheckFilterField("Fashion Item");
            Then.onTheFashion_ItemsList.onFilterBar().iCheckFilterField("Brand");
            Then.onTheFashion_ItemsList.onFilterBar().iCheckFilterField("Size");
            Then.onTheFashion_ItemsList.onFilterBar().iCheckFilterField("Price");
            Then.onTheFashion_ItemsList.onTable().iCheckColumns(7, {"fashionType/section/name":{"header":"Section Name"},"fashionType/typename":{"header":"Fashion Type"},"itemname":{"header":"Fashion Item"},"brand":{"header":"Brand"},"size":{"header":"Size"},"price":{"header":"Price"},"Currency_code":{"header":"Currency"}});

        });


        opaTest("Navigate to ObjectPage", function (Given, When, Then) {
            // Note: this test will fail if the ListReport page doesn't show any data
            
            When.onTheFashion_ItemsList.onFilterBar().iExecuteSearch();
            
            Then.onTheFashion_ItemsList.onTable().iCheckRows();

            When.onTheFashion_ItemsList.onTable().iPressRow(0);
            Then.onTheFashion_ItemsObjectPage.iSeeThisPage();

        });

        opaTest("Teardown", function (Given, When, Then) { 
            // Cleanup
            Given.iTearDownMyApp();
        });
    }

    runner.run([journey]);
});