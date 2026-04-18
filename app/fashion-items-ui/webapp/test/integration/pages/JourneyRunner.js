sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/fashionshop/fashionitemsui/test/integration/pages/Fashion_ItemsList",
	"com/fashionshop/fashionitemsui/test/integration/pages/Fashion_ItemsObjectPage"
], function (JourneyRunner, Fashion_ItemsList, Fashion_ItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/fashionshop/fashionitemsui') + '/test/flp.html#app-preview',
        pages: {
			onTheFashion_ItemsList: Fashion_ItemsList,
			onTheFashion_ItemsObjectPage: Fashion_ItemsObjectPage
        },
        async: true
    });

    return runner;
});

