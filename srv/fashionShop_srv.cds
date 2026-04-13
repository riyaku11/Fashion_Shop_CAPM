using app.fashioShop from '../db/fashioShop';

service FashionShop_Service {
    entity Sections        as projection on fashioShop.Sections;
    entity Fashion_Types   as projection on fashioShop.Fashion_Types;
    entity Fashion_Items   as projection on fashioShop.Fashion_Items;

    entity Srv_FashionShop as projection on fashioShop.YC_FashioShop;
}

annotate fashioShop.Fashion_Items with @(UI: {
    HeaderInfo             : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Online Fashion Shop',
        TypeNamePlural: 'Online Fashion Shop',
        Title         : {Value: itemname},
        Description   : {Value: 'Online Fashion Shop'}
    },

    LineItem               : [
        {Value: fashionType.section.name},
        {Value: fashionType.typename},
        {Value: itemname},
        {Value: brand},
        {Value: size},
        {Value: price},
        {Value: Currency_code},
    ],
    Facets                 : [{
        $Type : 'UI.CollectionFacet',
        Label : 'Fashion Details',
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#ItemDetails',
        }],
    }],
    FieldGroup #ItemDetails: {Data: [
        {Value: fashionType_id},
        {Value: fashionType.typename},
        {Value: itemname},
        {Value: size},
        {Value: price}
    ]

    },

});
