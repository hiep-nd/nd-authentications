//
//  Objects_NDAuthViewModel.h
//  NDAuthentications
//
//  Created by Nguyen Duc Hiep on 10/16/20.
//

#import <NDMVVM/NDMVVM.h>

#import <NDAuthentications/Abstracts_NDAuthViewModel.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDAuthViewModelHandlersProtocol)
@protocol NDAuthViewModelHandlers <NSObject>

@property(nonatomic, copy) void (^_Nullable signInHandler)
    (NSString* user,
     NSString* password,
     void (^completion)(NSError* _Nullable error));
@property(nonatomic, copy) void (^_Nullable signUpHandler)
    (NSString* user,
     NSString* password,
     void (^completion)(NSError* _Nullable error));

@end

NS_ASSUME_NONNULL_END

@interface NDAuthViewModel
    : NDViewModel <NDAuthViewModel, NDAuthViewModelHandlers>
@end
