Oschina

### Push hook

```json
{
    "password": "23451",
    "hook_name": "push_hooks",
    "push_data": {
        "before": "0000000000000000000000000000000000000000",
        "after": "ec7159240a346fa5988913aa3057b902a4acb126",
        "ref": "master",
        "user_id": 612749,
        "user_name": "Eatgrass",
        "user": {
            "id": 612749,
            "email": "huangjing@yihua.plus",
            "name": "Eatgrass",
            "time": "2016-02-03T15:30:43+08:00"
        },
        "repository": {
            "name": "yh-ci-service",
            "url": "https://git.oschina.net/eatgrass/yh-ci-service.git",
            "description": "CI runner",
            "homepage": "http://git.oschina.net/eatgrass/yh-ci-service"
        },
        "commits": [{
            "id": "ec7159240a346fa5988913aa3057b902a4acb126",
            "message": "A Test For WebHooks",
            "timestamp": "2015-11-06T13:21:07+08:00",
            "url": "http://git.oschina.net/eatgrass/yh-ci-service/commit/ec7159240a346fa5988913aa3057b902a4acb126",
            "author": {
                "name": "Eatgrass",
                "email": "huangjing@yihua.plus",
                "time": "2015-11-06T13:21:07+08:00"
            }
        }],
        "total_commits_count": 2,
        "commits_more_than_ten": 10
    }
}
```

### Comment Hook
{
    "password": "213456",
    "hook_name": "note_hooks",
    "push_data": {
        "id": 265996,
        "note": "\\u6d4b\\u8bd5\\u4e00\\u4e0b\\u8bc4\\u8bbaHook",
        "noteable_type": "Commit",
        "noteable_id": null,
        "author": {
            "id": 612749,
            "user_name": "eatgrass",
            "email": "huangjing@yihua.plus"
        }
    }
}
