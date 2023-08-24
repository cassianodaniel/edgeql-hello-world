module default {
  type AuthenticationCredentials {
    required name: str;
    required email: str;
    required password: str {
      constraint min_len_value(8);
    }
  }

  type User {
    required data: AuthenticationCredentials {
      constraint exclusive;
    }
    created_at: datetime;
  }

  scalar type CorrectOptionIndex extending enum<0,1,2>;

  type Answer {
    required correct_option_index: CorrectOptionIndex;
    required options: array<str>;
  }

  type Question {
    required name: str;
    required answer: Answer {
      constraint exclusive;
    }
  }

  type Classes {
    required name: str;
    multi students: User;
    required multi questions: Question; 
  }
}