class ApiConstraint
  HEADER_ACCEPT_REGEXP = /\A(application\/json|application\/vnd\.store-api\.v\d\+json)\z/

  def self.matches?(request)
    request.accept.match?(HEADER_ACCEPT_REGEXP)
  end
end
