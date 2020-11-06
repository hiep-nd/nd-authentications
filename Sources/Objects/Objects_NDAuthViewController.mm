//
//  Objects_NDAuthViewController.mm
//  NDAuthentications
//
//  Created by Nguyen Duc Hiep on 10/16/20.
//

#import <NDAuthentications/Objects_NDAuthViewController.h>

#import <NDAuthentications/Abstracts_NDAuthViewModel.h>

#import <NDAutolayoutUtils/NDAutolayoutUtils.h>
#import <NDMVVM/Privates/NDViewDefaultImpl.h>
#import <NDUtils/NDUtils.h>

@interface NDAuthViewController ()

@property(nonatomic, strong) UILabel* userLabel;
@property(nonatomic, strong) UITextField* userTextField;
@property(nonatomic, strong) UILabel* passwordLabel;
@property(nonatomic, strong) UITextField* passwordTextField;
@property(nonatomic, strong) UIButton* authButton;
@property(nonatomic, strong) UIButton* actionButton;

@end

@implementation NDAuthViewController

- (NSString*)user {
  return self.userTextField.text;
}

- (NSString*)password {
  return self.passwordTextField.text;
}

- (void)updateTitles {
  [self.actionButton setTitle:RViewModel(self).actionTitle
                     forState:kNilOptions];
  [self.authButton setTitle:RViewModel(self).authTitle forState:kNilOptions];
}

- (void)manualInit {
  [super manualInit];

  _userTextField = [[UITextField alloc] init];
  _userTextField.placeholder = NDLocalizedString(@"Enter the Email");

  _passwordTextField = [[UITextField alloc] init];
  _passwordTextField.secureTextEntry = YES;
  _passwordTextField.placeholder = NDLocalizedString(@"Enter the Password");

  _authButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [_authButton setTitle:NDLocalizedString(@"Login") forState:kNilOptions];
  [_authButton setTitleColor:UIColor.blackColor forState:kNilOptions];
  @weakify(self);
  [_authButton nd_events:UIControlEventTouchUpInside
              addAction0:^{
                @strongify(self);
                [RViewModel(self).auth on];
              }];

  _actionButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [_actionButton setTitleColor:UIColor.blackColor forState:kNilOptions];
  [_actionButton nd_events:UIControlEventTouchUpInside
                addAction0:^{
                  @strongify(self);
                  [RViewModel(self).action on];
                }];

  [self.view
           nd_wrapItems:@{
             @"user" : self.userTextField,
             @"password" : self.passwordTextField,
             @"auth" : self.authButton,
             @"action" : self.actionButton,
           }
      visualConstraints:@[
        @"V:[safeArea_top]-16-[user]-[password]-16-[auth]-[action]->=16-[safeArea_bottom]",
        @"H:[safeArea_center][user_center][password_center]",
        @"H:[safeArea_leading][auth][safeArea_trailing]",
        @"H:[safeArea_leading][action][safeArea_trailing]",
      ]];

  self.view.backgroundColor = UIColor.whiteColor;
}

- (void)didSetViewModelFromOldViewModel:(__kindof id<NDViewModel>)oldViewModel {
  [super didSetViewModelFromOldViewModel:oldViewModel];
  _userTextField.text = RViewModel(self).user;
  _passwordTextField.text = RViewModel(self).password;
  [self updateTitles];
}

namespace {
NDLocalizedString_Default_Impl(NDAuthViewController, @"NDAuthentications", nil);
}

NDView_RViewModel_Default_Impl(NDAuthViewModel);

@end
