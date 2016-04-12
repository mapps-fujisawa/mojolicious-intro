package MyApp::Model::Users;
use common::sense;

my $USERS = {
    hoge => '111',
    fuga => '222',
    bar  => '333'
};

sub new { bless {}, shift }

sub check {
    my ($self, $user, $pass) = @_;

    # Success
    return 1 if $USERS->{$user} && $USERS->{$user} eq $pass;

    # Fail
    return;
}

1;
