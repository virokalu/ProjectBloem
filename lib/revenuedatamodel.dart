
class RevenueDataModel{

    String street;
    String town;
    String postalCode;
    String sellername;
    String buyername;
    String itemid;
    int itemprice;
    int app_fee;
    int seller_amount;
    int apps_Total_amount;
    String stid;

  RevenueDataModel({required this.street,required this.town,required this.postalCode,required this.sellername,
  required this.buyername,required this.itemid, required this.itemprice, required this.app_fee,
  required this.seller_amount,required this.apps_Total_amount,required this.stid});
  
}