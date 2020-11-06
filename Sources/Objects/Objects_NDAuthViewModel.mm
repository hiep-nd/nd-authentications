//
//  Objects_NDAuthViewModel.mm
//  NDAuthentications
//
//  Created by Nguyen Duc Hiep on 10/16/20.
//

#import <NDAuthentications/Objects_NDAuthViewModel.h>

#import <NDAuthentications/Abstracts_NDAuthView.h>
#import <NDLog/NDLog.h>
#import <NDMVVM/Privates/NDViewModelDefaultImpl.h>

// class AuthViewModel: FeatureViewModel, AuthViewModelProtocol {

//  func auth() {
//    guard let model = coordinator?.authModel else {
//      nd_assertionFailure("Can not auth with auth model: 'nil'.")
//      return
//    }
//
//    let email = rView?.user ?? ""
//    let password = rView?.password ?? ""
//    (actionType == .register
//      ? model.register(email: email, password: password)
//      : model.login(email: email, password: password))
//      .subscribe(
//        onSuccess: { [weak self] _ in
//          self?.coordinator?.hideAuth()
//        },
//        onError: { [weak self] in
//          self?.handle(error: $0)
//        }
//      )
//      .disposed(by: disposeBag)
//  }
//

//
//// MARK: - Error handler
// extension NDViewModelProtocol {
//  func handle(
//    error: Error,
//    function: StaticString = #function,
//    file: StaticString = #file,
//    line: UInt = #line,
//    tag: Any? = nil
//  ) {
//    nd_log(
//      error: "Unhandled error: \(error).", function: function, file: file,
//      line: line, tag: tag)
//  }
//}

#import <map>

using namespace std;

namespace {
enum ActionType { SignIn, SignUp };

inline NSString* ToString(ActionType value) {
  static std::map<ActionType, NSString*> strings = {
      {ActionType::SignIn, @"SignIn"},
      {ActionType::SignUp, @"SignUp"},
  };

  return strings[value];
}
}

@interface NDAuthViewModel ()

@property(nonatomic, assign) ActionType actionType;

@end

@implementation NDAuthViewModel

@synthesize password;
@synthesize user;
@synthesize auth = _auth;
@synthesize action = _action;
@synthesize signInHandler;
@synthesize signUpHandler;

- (NSString*)authTitle {
  static map<ActionType, NSString*> titles = {
      {ActionType::SignIn, NDLocalizedString(@"Login")},
      {ActionType::SignUp, NDLocalizedString(@"Register")},
  };
  return titles[_actionType];
}

- (NSString*)actionTitle {
  static map<ActionType, NSString*> titles = {
      {ActionType::SignIn,
       NDLocalizedString(@"Not register yet? Create an account")},
      {ActionType::SignUp,
       NDLocalizedString(@"Have got an account already? Just login")},
  };
  return titles[_actionType];
}

- (instancetype)init {
  self = [super init];
  if (self) {
    _actionType = ActionType::SignIn;

    _auth = [NDEvent
        eventWithOwner:self
               handler:^(id<NSObject> owner) {
                 auto self = (NDAuthViewModel*)owner;
                 auto authHandler = (self.actionType == ActionType::SignIn)
                                        ? self.signInHandler
                                        : self.signUpHandler;
                 if (!authHandler) {
                   NDAssertionFailure(@"Can not auth with action type: '%@', "
                                      @"auth handler: 'nil'.",
                                      ToString(self.actionType));
                   return;
                 }

                 authHandler(RView(self).user, RView(self).password,
                             ^(NSError* error) {
                               if (error) {
                                 NDLogError(@"Unhandled error: \(%@).", error);
                                 return;
                               }
                             });
               }];

    _action = [NDEvent eventWithOwner:self
                              handler:^(id<NSObject> owner) {
                                auto self = (NDAuthViewModel*)owner;
                                if (self.actionType == ActionType::SignIn) {
                                  self.actionType = ActionType::SignUp;
                                } else {
                                  self.actionType = ActionType::SignIn;
                                }
                                [RView(self) updateTitles];
                              }];
  }

  return self;
}

NDViewModel_RView_Default_Impl(NDAuthView);

namespace {
NDLocalizedString_Default_Impl(NDAuthViewModel, @"NDAuthentications", nil);
}

@end
