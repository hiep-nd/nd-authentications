//
//  Abstracts_NDAuthModel.h
//  NDAuthentications
//
//  Created by Nguyen Duc Hiep on 10/16/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDAuthModelProtocol)
@protocol NDAuthModel <NSObject>

- (void)signUpWithUser:(NSString*)user
              password:(NSString*)password
            completion:(void (^)(void))completion;

- (void)signInWithUser:(NSString*)user
              password:(NSString*)password
            completion:(void (^)(void))completion;

- (void)signOutWithCompletion:(void (^)(void))completion;

@end

NS_ASSUME_NONNULL_END
