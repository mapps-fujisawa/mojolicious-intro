package MyApp::Controller::MyController;
use common::sense;
use parent 'Mojolicious::Controller';

use lib 'lib';
use MyApp::Model::Users;

sub get_root {
    my $self = shift;
    $self->render('root/get_root');
}

sub post_root {
    my $self = shift;
    $self->redirect_to('root');
}

sub get_json {
    my $self = shift;
    $self->render(json => { hello => 'world' });
}

# /?user=hoge&pass=111
sub get_user {
    my $self = shift;
    my $user = $self->param('user');
    my $pass = $self->param('pass');
    my $users = MyApp::Model::Users->new;

    $self->app->log->debug(%$self);

    $self->render(text => 'Wrong username or password.') #failure
        if not $users->check($user, $pass);

    $self->render(text => "Welcome $user."); #success
}

1;
