//
//  MockPostDataProvider.swift
//  ComponentProvider
//
//  Created by Roy Hsu on 17/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - MockPostDataProvider

public final class MockPostDataProvider: PostDataProvider {

    // MARK: Property

    private final let mockPosts: [Post] = [
        Post(
            id: "01",
            content: "Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Curabitur blandit tempus porttitor. Cras mattis consectetur purus sit amet fermentum. Donec ullamcorper nulla non metus auctor fringilla. Sed posuere consectetur est at lobortis."
        ),
        Post(
            id: "02",
            content: "Maecenas sed diam eget risus varius blandit sit amet non magna. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Nullam id dolor id nibh ultricies vehicula ut id elit. Vestibulum id ligula porta felis euismod semper. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus."
        ),
        Post(
            id: "03",
            content: "Maecenas sed diam eget risus varius blandit sit amet non magna. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor."
        ),
        Post(
            id: "04",
            content: "Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Etiam porta sem malesuada magna mollis euismod. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis."
        ),
        Post(
            id: "05",
            content: "Praesent commodo cursus magna, vel scelerisque nisl consectetur et."
        )
    ]

    public final weak var dataProviderDelegate: PostDataProviderDelegate?

    // MARK: PostDataProvider

    public func fetch() {

        dataProviderDelegate?.dataProviderDidFetch(self)

    }

    public func numberOfPosts() -> Int {

        return mockPosts.count

    }

    public func post(at index: Int) -> Post {

        return mockPosts[index]

    }

}
