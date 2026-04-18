sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.fashionshop.fashionitemsui',
            componentId: 'Fashion_ItemsObjectPage',
            contextPath: '/Fashion_Items'
        },
        CustomPageDefinitions
    );
});