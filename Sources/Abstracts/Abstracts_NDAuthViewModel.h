//
//  Abstracts_NDAuthViewModel.h
//  NDAuthentications
//
//  Created by Nguyen Duc Hiep on 10/16/20.
//

#import <NDMVVM/NDMVVM.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDAuthViewModelProtocol)
@protocol NDAuthViewModel <NDViewModel>

@property(nonatomic, readonly) NSString* _Nullable user;
@property(nonatomic, readonly) NSString* _Nullable password;
@property(nonatomic, readonly) NSString* _Nullable authTitle;
@property(nonatomic, readonly) NSString* _Nullable actionTitle;
@property(nonatomic, readonly)
    __kindof NDEvent<__kindof id<NDAuthViewModel>>* auth;
@property(nonatomic, readonly)
    __kindof NDEvent<__kindof id<NDAuthViewModel>>* action;

@end

NS_ASSUME_NONNULL_END
