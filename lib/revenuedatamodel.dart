
class RevenueDataModel{

    String street;
    String town;
    String postalCode;
    String sellername;
    String buyername;
    String itemid;
    double itemprice;
    double app_fee;
    double seller_amount;
    double apps_Total_amount;

  RevenueDataModel({required this.street,required this.town,required this.postalCode,required this.sellername,
  required this.buyername,required this.itemid, required this.itemprice, required this.app_fee,
  required this.seller_amount,required this.apps_Total_amount});
  
}