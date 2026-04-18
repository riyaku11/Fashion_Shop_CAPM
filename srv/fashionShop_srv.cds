using app.fashioShop from '../db/fashioShop';

// @requires: 'authenticated-user'
@requires: 'manager'
service FashionShop_Service {
    @restrict: [
        {
            grant: 'READ',
            to   : 'viewer'
        },
        {
            grant: 'READ',
            to   : 'admin'
        },
        {
            grant: [
                'READ',
                'CREATE',
                'UPDATE',
                'DELETE'
            ],
            to   : 'manager'
        }
    ]
    entity Sections        as projection on fashioShop.Sections;

    @cds.redirection.target: true
    @restrict              : [
        {
            grant: 'READ',
            to   : 'viewer'
        },
        {
            grant: 'READ',
            to   : 'admin'
        },
        {
            grant: [
                'READ',
                'CREATE',
                'UPDATE',
                'DELETE'
            ],
            to   : 'manager'
        }
    ]
    entity Fashion_Types   as projection on fashioShop.Fashion_Types;

    @restrict: [
        {
            grant: 'READ',
            to   : 'viewer'
        },
        {
            grant: [
                'READ',
                'CREATE',
                'UPDATE',
                'DELETE'
            ],
            to   : 'admin'
        },
        {
            grant: [
                'READ',
                'CREATE',
                'UPDATE',
                'DELETE'
            ],
            to   : 'manager'
        }
    ]
    entity Fashion_Items   as projection on fashioShop.Fashion_Items;

    @restrict: [
        {
            grant: 'READ',
            to   : 'viewer'
        },
        {
            grant: 'READ',
            to   : 'admin'
        },
        {
            grant: 'READ',
            to   : 'manager'
        }
    ]
    entity Srv_FashionShop as projection on fashioShop.YC_FashioShop;

    @restrict: [
        {
            grant: 'READ',
            to   : 'viewer'
        },
        {
            grant: 'READ',
            to   : 'admin'
        },
        {
            grant: 'READ',
            to   : 'manager'
        }
    ]
    entity F4_FashionType  as projection on fashioShop.YC_FashionType;
}

@odata.draft.enabled
annotate fashioShop.Fashion_Items with @(UI: {
    HeaderInfo             : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Online Fashion Shop',
        TypeNamePlural: 'Online Fashion Shop',
        Title         : {Value: itemname},
        Description   : {Value: 'Online Fashion Shop'}
    },

    SelectionFields        : [
        fashionType_id,
        itemname,
        brand,
        size,
        price
    ],

    LineItem               : [
        {Value: fashionType.section.name},
        {Value: fashionType.typename},
        {Value: itemname},
        {Value: brand},
        {Value: size},
        {Value: price},
        {Value: Currency_code},
    ],
    Facets                 : [
        {
            $Type : 'UI.CollectionFacet',
            ID    : 1,
            Label : 'Fashion Types and Section',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#TypeSection',
            }],
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 2,
            Label : 'Fashion Items',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#FItem',
            }],
        },

    ],
    FieldGroup #TypeSection: {Data: [
        {Value: fashionType_id},
        {
            Value                  : fashionType.typename,
            ![@Common.FieldControl]: #ReadOnly
        },
        {
            Value                  : fashionType.description,
            ![@Common.FieldControl]: #ReadOnly
        },
        {
            Value                  : fashionType.section.id,
            ![@Common.FieldControl]: #ReadOnly
        },
        {
            Value                  : fashionType.section.name,
            ![@Common.FieldControl]: #ReadOnly
        }
    ]

    },

    FieldGroup #FItem      : {Data: [
        {Value: id},
        {Value: itemname},
        {Value: brand},
        {Value: material},
        {Value: size},
        {Value: price},
        {Value: Currency_code},
        {Value: isAvailable}
    ]

    },

});


annotate FashionShop_Service.Fashion_Items with {

    fashionType @(
        title         : 'Fashion Type',
        sap.value.list: 'fixed-values',
        Common        : {
            ValueListWithFixedValues,
            ValueList: {
                CollectionPath: 'F4_FashionType',
                Parameters    : [
                    {
                        $Type            : 'Common.ValueListParameterInOut',
                        ValueListProperty: 'fashionTypeID',
                        LocalDataProperty: fashionType_id
                    },
                    {
                        $Type            : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'sectionName',
                    },
                    {
                        $Type            : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'fashionTypeName',
                    }
                ]

            },
        }
    )
};
