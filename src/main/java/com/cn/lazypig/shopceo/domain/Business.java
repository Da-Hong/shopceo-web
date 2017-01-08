package com.cn.lazypig.shopceo.domain;

/**
 * 商户信息
 * 
 * @author MY
 *
 */
public class Business {
	private Integer id;

	private String businessId;

	private String name;

	private String branchName;

	private String address;

	private String email;

	private String phone;

	private String telephone;

	private String city;

	private String regions;

	private String categories;

	private Float latitude;

	private Float longitude;

	private Float avgRating;

	private String ratingImgUrl;

	private String ratingSImgUrl;

	private Integer productGrade;

	private Integer decorationGrade;

	private Integer serviceGrade;

	private Float productScore;

	private Float decorationScore;

	private Float serviceScore;

	private Integer avgPrice;

	private Integer reviewCount;

	private String reviewListUrl;

	private String businessUrl;

	private String photoUrl;

	private String sPhotoUrl;

	private Integer photoCount;

	private String photoListUrl;

	private Integer hasCoupon;

	private Integer couponId;

	private String couponDescription;

	private String couponUrl;

	private Integer hasDeal;

	private Integer dealCount;

	private String deals;

	private String dealsId;

	private String dealsDescription;

	private String dealsUrl;

	private Integer hasOnlineReservation;

	private String onlineReservationUrl;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBusinessId() {
		return businessId;
	}

	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName == null ? null : branchName.trim();
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address == null ? null : address.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone == null ? null : telephone.trim();
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city == null ? null : city.trim();
	}

	public String getRegions() {
		return regions;
	}

	public void setRegions(String regions) {
		this.regions = regions == null ? null : regions.trim();
	}

	public String getCategories() {
		return categories;
	}

	public void setCategories(String categories) {
		this.categories = categories == null ? null : categories.trim();
	}

	public Float getLatitude() {
		return latitude;
	}

	public void setLatitude(Float latitude) {
		this.latitude = latitude;
	}

	public Float getLongitude() {
		return longitude;
	}

	public void setLongitude(Float longitude) {
		this.longitude = longitude;
	}

	public Float getAvgRating() {
		return avgRating;
	}

	public void setAvgRating(Float avgRating) {
		this.avgRating = avgRating;
	}

	public String getRatingImgUrl() {
		return ratingImgUrl;
	}

	public void setRatingImgUrl(String ratingImgUrl) {
		this.ratingImgUrl = ratingImgUrl == null ? null : ratingImgUrl.trim();
	}

	public String getRatingSImgUrl() {
		return ratingSImgUrl;
	}

	public void setRatingSImgUrl(String ratingSImgUrl) {
		this.ratingSImgUrl = ratingSImgUrl == null ? null : ratingSImgUrl.trim();
	}

	public Integer getProductGrade() {
		return productGrade;
	}

	public void setProductGrade(Integer productGrade) {
		this.productGrade = productGrade;
	}

	public Integer getDecorationGrade() {
		return decorationGrade;
	}

	public void setDecorationGrade(Integer decorationGrade) {
		this.decorationGrade = decorationGrade;
	}

	public Integer getServiceGrade() {
		return serviceGrade;
	}

	public void setServiceGrade(Integer serviceGrade) {
		this.serviceGrade = serviceGrade;
	}

	public Float getProductScore() {
		return productScore;
	}

	public void setProductScore(Float productScore) {
		this.productScore = productScore;
	}

	public Float getDecorationScore() {
		return decorationScore;
	}

	public void setDecorationScore(Float decorationScore) {
		this.decorationScore = decorationScore;
	}

	public Float getServiceScore() {
		return serviceScore;
	}

	public void setServiceScore(Float serviceScore) {
		this.serviceScore = serviceScore;
	}

	public Integer getAvgPrice() {
		return avgPrice;
	}

	public void setAvgPrice(Integer avgPrice) {
		this.avgPrice = avgPrice;
	}

	public Integer getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(Integer reviewCount) {
		this.reviewCount = reviewCount;
	}

	public String getReviewListUrl() {
		return reviewListUrl;
	}

	public void setReviewListUrl(String reviewListUrl) {
		this.reviewListUrl = reviewListUrl == null ? null : reviewListUrl.trim();
	}

	public String getBusinessUrl() {
		return businessUrl;
	}

	public void setBusinessUrl(String businessUrl) {
		this.businessUrl = businessUrl == null ? null : businessUrl.trim();
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl == null ? null : photoUrl.trim();
	}

	public String getsPhotoUrl() {
		return sPhotoUrl;
	}

	public void setsPhotoUrl(String sPhotoUrl) {
		this.sPhotoUrl = sPhotoUrl == null ? null : sPhotoUrl.trim();
	}

	public Integer getPhotoCount() {
		return photoCount;
	}

	public void setPhotoCount(Integer photoCount) {
		this.photoCount = photoCount;
	}

	public String getPhotoListUrl() {
		return photoListUrl;
	}

	public void setPhotoListUrl(String photoListUrl) {
		this.photoListUrl = photoListUrl == null ? null : photoListUrl.trim();
	}

	public Integer getHasCoupon() {
		return hasCoupon;
	}

	public void setHasCoupon(Integer hasCoupon) {
		this.hasCoupon = hasCoupon;
	}

	public Integer getCouponId() {
		return couponId;
	}

	public void setCouponId(Integer couponId) {
		this.couponId = couponId;
	}

	public String getCouponDescription() {
		return couponDescription;
	}

	public void setCouponDescription(String couponDescription) {
		this.couponDescription = couponDescription == null ? null : couponDescription.trim();
	}

	public String getCouponUrl() {
		return couponUrl;
	}

	public void setCouponUrl(String couponUrl) {
		this.couponUrl = couponUrl == null ? null : couponUrl.trim();
	}

	public Integer getHasDeal() {
		return hasDeal;
	}

	public void setHasDeal(Integer hasDeal) {
		this.hasDeal = hasDeal;
	}

	public Integer getDealCount() {
		return dealCount;
	}

	public void setDealCount(Integer dealCount) {
		this.dealCount = dealCount;
	}

	public String getDeals() {
		return deals;
	}

	public void setDeals(String deals) {
		this.deals = deals == null ? null : deals.trim();
	}

	public String getDealsId() {
		return dealsId;
	}

	public void setDealsId(String dealsId) {
		this.dealsId = dealsId == null ? null : dealsId.trim();
	}

	public String getDealsDescription() {
		return dealsDescription;
	}

	public void setDealsDescription(String dealsDescription) {
		this.dealsDescription = dealsDescription == null ? null : dealsDescription.trim();
	}

	public String getDealsUrl() {
		return dealsUrl;
	}

	public void setDealsUrl(String dealsUrl) {
		this.dealsUrl = dealsUrl == null ? null : dealsUrl.trim();
	}

	public Integer getHasOnlineReservation() {
		return hasOnlineReservation;
	}

	public void setHasOnlineReservation(Integer hasOnlineReservation) {
		this.hasOnlineReservation = hasOnlineReservation;
	}

	public String getOnlineReservationUrl() {
		return onlineReservationUrl;
	}

	public void setOnlineReservationUrl(String onlineReservationUrl) {
		this.onlineReservationUrl = onlineReservationUrl == null ? null : onlineReservationUrl.trim();
	}
}