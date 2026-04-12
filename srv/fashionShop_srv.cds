using app.fashioShop from '../db/fashioShop';

service FashionShop_Service {
    entity Sections as projection on fashioShop.Sections;
    entity Fashion_Types as projection on fashioShop.Fashion_Types;
    entity Fashion_Items as projection on fashioShop.Fashion_Items;

    

}