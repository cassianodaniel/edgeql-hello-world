CREATE MIGRATION m1bc45leefkq25o5zkvpy2f3yky2wjivs6ij5s2vp4wyuf6jiychfa
    ONTO initial
{
  CREATE SCALAR TYPE default::CorrectOptionIndex EXTENDING enum<`0`, `1`, `2`>;
  CREATE TYPE default::Answer {
      CREATE REQUIRED PROPERTY correct_option_index: default::CorrectOptionIndex;
      CREATE REQUIRED PROPERTY options: array<std::str>;
  };
  CREATE TYPE default::Question {
      CREATE REQUIRED LINK answer: default::Answer {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE REQUIRED PROPERTY name: std::str;
  };
  CREATE TYPE default::AuthenticationCredentials {
      CREATE REQUIRED PROPERTY email: std::str;
      CREATE REQUIRED PROPERTY name: std::str;
      CREATE REQUIRED PROPERTY password: std::str {
          CREATE CONSTRAINT std::min_len_value(8);
      };
  };
  CREATE TYPE default::User {
      CREATE REQUIRED LINK data: default::AuthenticationCredentials {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE PROPERTY created_at: std::datetime;
  };
  CREATE TYPE default::Classes {
      CREATE REQUIRED MULTI LINK questions: default::Question;
      CREATE MULTI LINK students: default::User;
      CREATE REQUIRED PROPERTY name: std::str;
  };
};
