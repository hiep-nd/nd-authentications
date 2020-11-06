//
//  Firebase_NDAuthViewModelHandlers+Firebase.mm
//  NDAuthentications
//
//  Created by Nguyen Duc Hiep on 10/16/20.
//

#import <NDAuthentications/Firebase_NDAuthViewModelHandlers+Firebase.h>

#import <FirebaseAuth/FirebaseAuth.h>
#import <NDUtils/NDUtils.h>

void NDApplyFirebaseAuth(__kindof id<NDAuthViewModelHandlers> handlers) {
  handlers.signInHandler =
      ^(NSString* user, NSString* password, void (^completion)(NSError*)) {
        [FIRAuth.auth
            signInWithEmail:user
                   password:password
                 completion:^(FIRAuthDataResult* authResult, NSError* error) {
                   NDCallIfCan(completion, error);
                 }];
      };
  handlers.signUpHandler = ^(NSString* user, NSString* password,
                             void (^completion)(NSError*)) {
    [FIRAuth.auth
        createUserWithEmail:user
                   password:password
                 completion:^(FIRAuthDataResult* authResult, NSError* error) {
                   NDCallIfCan(completion, error);
                 }];
  };
}
