//
//  MY_MapVC.m
//  Baisibudejie
//
//  Created by dqong on 2016/11/7.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "MY_MapVC.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "BaiduMapBottomView.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import<BaiduMapAPI_Search/BMKGeocodeSearch.h>
#import<BaiduMapAPI_Search/BMKPoiSearchType.h>
@interface MY_MapVC ()<UITextFieldDelegate,BMKMapViewDelegate,BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate,qiandaoBtnDelegate>

@property (nonatomic, strong) BMKMapView * mapView;
@property (nonatomic, strong) UIButton * locationBtn;
@property (nonatomic, strong) BaiduMapBottomView * bottomView;
@end

@implementation MY_MapVC
{

    BMKLocationService* _locService;
    BMKGeoCodeSearch *_geocodesearch; //地理编码主类，用来查询、返回结果信息

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"百度地图";
    [self createUI];
}

- (void)createUI{
    
    [self.view addSubview:self.mapView];
    _locService = [[BMKLocationService alloc]init];
    _geocodesearch = [[BMKGeoCodeSearch alloc] init];
    _geocodesearch.delegate = self;
    [self.view addSubview:self.locationBtn];
    [self.view addSubview:self.bottomView];
    
//    UIImageView * img = [UIImageView new];
//    img.image = [UIImage imageNamed:@"zanLeftbat"];
//    BMKActionPaopaoView * pView = [[BMKActionPaopaoView alloc]initWithCustomView:img];
//    // ((BMKPinAnnotationView *)newAnnotationView).paopaoView = pView;
    CLLocationCoordinate2D location4=CLLocationCoordinate2DMake(31.56, 114.09);
    
    BMKPointAnnotation *annotation4=[[BMKPointAnnotation alloc]init];
    
    annotation4.title=@"大悟";
    
    annotation4.subtitle=@"＊＊＊＊";
    
    annotation4.coordinate=location4;
    
    //annotation4.image = [UIImage imageNamed:@"zanLeftbat"];
    
    [self.mapView addAnnotation:annotation4];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    /**
     *  在viewDidAppear禁用边缘并禁止自写pop返回功能
     *
     *  在viewwillDisAppear时候开启边缘触发功能
     *
     */
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    self.navigationController.fd_fullscreenPopGestureRecognizer.enabled = NO;
    self.mapView.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H);
    self.locationBtn.frame = CGRectMake(20, SCREEN_H - 100, 30, 30);
    self.bottomView.frame = CGRectMake(0, SCREEN_H - 64, SCREEN_W, 64);
    self.mapView.delegate = self;
    _locService.delegate = self;

   //开始第一次定位
    [self FirstLocation];
}
- (void)FirstLocation{

    [_locService startUserLocationService];
    _mapView.userTrackingMode = BMKUserTrackingModeNone;
    _mapView.showsUserLocation = YES;
   // _mapView.zoomLevel = 19;

}
#pragma mark - 点击定位按钮
- (void)locationBtnClick:(UIButton *)btn{
    [_locService startUserLocationService];
    _mapView.showsUserLocation = NO;
    _mapView.userTrackingMode = BMKUserTrackingModeNone;
    _mapView.showsUserLocation = YES;


}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    _mapView.delegate = nil;
    _locService.delegate = nil;
    

}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    /**
     *  在viewDidAppear禁用边缘并禁止自写pop返回功能
     *
     *  在viewwillDisAppear时候开启边缘触发功能
     *
     */
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    self.navigationController.fd_fullscreenPopGestureRecognizer.enabled = NO;

}
- (void)willStartLocatingUser{
    ZYLog(@"start locate");

}
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation{
    [_mapView updateLocationData:userLocation];
    
}
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation{
    [_mapView updateLocationData:userLocation];
    _mapView.centerCoordinate = userLocation.location.coordinate;
    BMKReverseGeoCodeOption *reverseGeocodeSearchOption = [[BMKReverseGeoCodeOption alloc]init];
    reverseGeocodeSearchOption.reverseGeoPoint = userLocation.location.coordinate;
    
    BOOL flag = [_geocodesearch reverseGeoCode:reverseGeocodeSearchOption];
    
    if(flag){
        
        ZYLog(@"反geo检索发送成功");
        
        [_locService stopUserLocationService];
        
    }else{
        
        ZYLog(@"反geo检索发送失败");
        
    }
    
    _mapView.zoomLevel = 19;
}
#pragma mark -------------地理反编码的delegate---------------

-(void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error

{
    
    ZYLog(@"address:%@----%@",result.addressDetail,result.address);
    _bottomView.addressLabel.text = result.address;
    _bottomView.timeLabel.text = [ZY_Method getCurrentTimes];
    //addressDetail:     层次化地址信息
    
    //address:    地址名称
    
    //businessCircle:  商圈名称
    
    // location:  地址坐标
    
    //  poiList:   地址周边POI信息，成员类型为BMKPoiInfo
    
}
-(BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation{
    BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
    
    newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
    
    newAnnotationView.animatesDrop = YES;//设置该标点动画显示
    
    newAnnotationView.annotation = annotation;
    return newAnnotationView;

}
/**
 *在地图View停止定位后，会调用此函数
 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}

#pragma mark - qiandaoBtn
- (void)gotoQiandao{
    NSString * qiandaoStr =[NSString stringWithFormat:@"Address:%@\nTime:%@",_bottomView.addressLabel.text,_bottomView.timeLabel.text];
    UIAlertView * al = [[UIAlertView alloc]initWithTitle:@"签到信息" message:qiandaoStr delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [al show];

}
#pragma mark - lan
- (BMKMapView *)mapView{
    if (_mapView == nil) {
        _mapView = [[BMKMapView alloc]init];
        
    }
    return _mapView;
}
- (UIButton *)locationBtn{
    if (_locationBtn == nil) {
        _locationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_locationBtn setTitle:@"定" forState:UIControlStateNormal];
        [_locationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _locationBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _locationBtn.backgroundColor = [UIColor redColor];
        [_locationBtn addTarget:self action:@selector(locationBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _locationBtn.layer.masksToBounds = YES;
        _locationBtn.layer.cornerRadius  = 15;
    }
    return _locationBtn;
}
- (BaiduMapBottomView *)bottomView{
    if (_bottomView == nil) {
        _bottomView = [BaiduMapBottomView new];
        _bottomView.Delegate = self;
        _bottomView.backgroundColor = [UIColor colorWithRed:235/255.0 green:243/255.0 blue:231/255.0 alpha:0.7];
    }
    return _bottomView;
}
- (void)dealloc {
    if (_mapView) {
        _mapView = nil;
    }
}
@end
