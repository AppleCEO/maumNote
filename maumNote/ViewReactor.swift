//
//  ViewReactor.swift
//  maumNote
//
//  Created by joon-ho kil on 2020/05/23.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import ReactorKit

final class ViewReactor: Reactor {
  enum Action {
    case add(Memo?)
  }

  enum Mutation {
    case addMemos(Memo)
  }

  struct State {
    var memos: [Memo]
  }

  let initialState = State(memos: [Memo(title: "Welcome to Texture-KR", content: ""), Memo(title: "Welcome to Texture-KR", content: ""), Memo(title: "Welcome to Texture-KR, long test!!!!!!!!!!!!!!!!!!!!!!!!!!!!!", content: "")])

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case let .add(memo): // when user updates the search query
      if let memo = memo {
        return Observable.just(Mutation.addMemos(memo))
      }
      return Observable<Mutation>.empty()
    }
  }

  func reduce(state: State, mutation: Mutation) -> State {
    switch mutation {
    case let .addMemos(memo):
      var newState = state
      newState.memos.append(memo)
      return newState
    }
  }
}
