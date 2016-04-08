package MyApp::MyController;
use common::sense;
use parent 'Mojolicious::Controller';

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

1;
