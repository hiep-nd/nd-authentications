//
//  Abstracts_NDAuthView.h
//  NDAuthentications
//
//  Created by Nguyen Duc Hiep on 10/16/20.
//

#import <NDMVVM/NDMVVM.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDAuthViewProtocol)
@protocol NDAuthView <NDView>

@property(nonatomic, readonly) NSString* _Nullable user;
@property(nonatomic, readonly) NSString* _Nullable password;

- (void)updateTitles;

@end

NS_ASSUME_NONNULL_END
