//
//  ViewController.m
//  PhoneRegister
//
//  Created by Alejandra B on 27/11/15.
//  Copyright © 2015 alebautista. All rights reserved.
//

#import "Register.h"
#import <DigitsKit/DigitsKit.h>


@interface Register ()

@end

@implementation Register

- (void)viewDidLoad {
    [super viewDidLoad];
      [[Digits sharedInstance] logOut];
    // Do any additional setup after loading the view, typically from a nib.
    /*DGTAuthenticateButton *authButton;
    authButton = [DGTAuthenticateButton buttonWithAuthenticationCompletion:^(DGTSession *session, NSError *error) {
        if (session.userID) {
            // TODO: associate the session userID with your user model
            NSString *msg = [NSString stringWithFormat:@"Phone number: %@", session.phoneNumber];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You are logged in!"
                                                            message:msg
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        } else if (error) {
            NSLog(@"Authentication error: %@", error.localizedDescription);
        }
    }];
    authButton.center = self.view.center;
    [self.view addSubview:authButton];*/

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLogin:(id)sender {
    [[Digits sharedInstance] authenticateWithCompletion:^(DGTSession *session, NSError *error) {
        self.lblPhone.text=[session phoneNumber];
        [[Digits sharedInstance] logOut];
        // Inspect session/error objects
    }];
}
@end
