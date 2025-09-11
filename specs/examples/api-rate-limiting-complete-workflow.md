# RPI Loop: Complete Example Workflow
*Real-world example: Adding rate limiting to API endpoints*

## Example: API Rate Limiting Implementation

This example demonstrates a complete RPI Loop cycle for implementing rate limiting in a Node.js API, showing how the methodology prevents "vibe coding" and ensures systematic implementation.

---

## Phase 1: Research

### Command Executed
```bash
/rpi research start "API rate limiting for user endpoints"
```

### Research Output: `01-research.md`

```markdown
# Research: API Rate Limiting for User Endpoints
*Generated: 2024-01-15 14:30:22 | Phase: Research | Session: rpi-001*

## 🎯 Problem Statement

### Core Problem
API endpoints are receiving abuse from automated clients causing:
- Server overload during peak times
- Degraded performance for legitimate users  
- Potential DDoS vulnerability
- No protection against credential stuffing attacks

### Business Impact  
- 23% increase in support tickets about slow response times
- Lost revenue from legitimate users unable to access service
- Security risk from uncontrolled access attempts
- Infrastructure costs rising due to excessive load

### Current Pain Points
- No rate limiting mechanism in place
- Manual IP blocking reactive and ineffective
- Legitimate users affected by server overload
- No visibility into abuse patterns

---

## 🏗️ System Understanding  

### Architecture Overview
Express.js API server with Redis session store and PostgreSQL database

### Key Components
- **Express Router**: `src/routes/api.js:15-89` - Main API endpoint definitions
- **Auth Middleware**: `src/middleware/auth.js:23-67` - Current authentication logic
- **User Controller**: `src/controllers/user.js:12-156` - User endpoint handlers
- **Redis Client**: `src/config/redis.js:8-34` - Session and caching layer

### Data Flow
```
[Client Request] → [Express Router] → [Auth Middleware] → [User Controller] → [Database]
```

### Critical Interfaces
- **POST /api/auth/login**: `src/routes/api.js:45` - Login endpoint (most abused)
- **POST /api/users/register**: `src/routes/api.js:52` - Registration endpoint
- **GET /api/users/profile**: `src/routes/api.js:67` - Profile access (authenticated)

### Dependencies
- **External Services**: Redis for session storage
- **Databases**: PostgreSQL for user data
- **Third-party APIs**: None relevant to rate limiting

---

## 📍 Problem Location

### Primary Files
- `src/routes/api.js:15-89` - Where rate limiting middleware needs integration
- `src/middleware/auth.js:23-67` - Existing middleware pattern to follow
- `src/config/redis.js:8-34` - Redis connection for rate limit storage

### Related Components  
- **Upstream**: Load balancer (nginx) - should coordinate with our rate limiting
- **Downstream**: Database connections - protect from excessive queries
- **Siblings**: Other middleware (CORS, body parser) - insertion order matters

### Integration Points
- **Database interactions**: No direct database impact
- **API endpoints**: All user-facing endpoints need protection
- **External services**: Redis for storing rate limit counters

---

## ⚖️ Constraints & Requirements

### Technical Constraints
- **Performance**: Rate limiting cannot add >5ms latency
- **Compatibility**: Must work with existing Express middleware stack
- **Security**: Must prevent bypass through header manipulation
- **Scale**: Handle 10,000 requests/minute across all endpoints

### Business Constraints
- **Timeline**: Must deploy within 2 weeks (security urgency)
- **Resources**: Single developer, 20 hours available
- **Compliance**: Must log rate limit violations for audit

### Team Constraints  
- **Skills**: Team familiar with Express, Redis, limited rate limiting experience
- **Availability**: Must implement without blocking ongoing feature development
- **Process**: Requires load testing before production deployment

---

## ✅ Success Criteria

### Functional Requirements
- [ ] Rate limiting active on all public API endpoints
- [ ] Different limits for authenticated vs unauthenticated users
- [ ] Graceful error responses when limits exceeded
- [ ] Admin endpoints for viewing/modifying rate limits

### Performance Requirements
- [ ] <5ms additional latency per request
- [ ] Handle 10,000 requests/minute without degradation
- [ ] Redis memory usage <100MB for rate limit data

### Quality Requirements
- [ ] 100% uptime during deployment (blue-green)
- [ ] Comprehensive logging of rate limit events
- [ ] Monitoring and alerting for abuse patterns

### Business Requirements
- [ ] 95% reduction in abuse-related support tickets
- [ ] Legitimate user experience unaffected
- [ ] Security audit compliance for rate limiting controls

---

## ❓ Open Questions

### Technical Questions
- [x] Redis vs in-memory storage? → Redis for multi-instance deployment
- [x] Rate limit algorithm? → Sliding window with Redis sorted sets
- [x] Bypass mechanism for internal services? → API key whitelist

### Business Questions
- [x] Rate limits per endpoint? → Login: 5/min, Register: 3/min, Profile: 100/min
- [x] Geographic restrictions needed? → No, global rate limits sufficient
- [x] Premium user different limits? → Yes, 2x limits for premium tier

### Process Questions
- [x] Deployment strategy? → Blue-green with gradual rollout
- [x] Testing approach? → Load testing with gradual rate limit enforcement
- [x] Monitoring requirements? → Real-time dashboards, weekly reports

---

## 📊 Research Quality Checklist

- [x] Problem clearly defined with business context
- [x] System architecture understood with file:line specificity
- [x] All dependencies and constraints identified
- [x] Success criteria are measurable and testable
- [x] All questions answered or marked for follow-up
- [x] No implementation details included (stay at "what" level)

---
**Research Status**: Complete
**Context Utilization**: 28%
**Next Phase**: Planning
**Validation Notes**: Approved by team lead - proceed to planning
```

---

## Phase 2: Planning

### Command Executed
```bash
/rpi plan start
```

### Planning Output: `02-plan.md`

```markdown
# Implementation Plan: API Rate Limiting for User Endpoints
*Generated: 2024-01-15 15:45:33 | Phase: Planning | Session: rpi-001*
*Based on Research: `01-research.md`*

## 📋 Implementation Strategy

### Context Budget Management
- **Context Target**: < 40% utilization throughout implementation
- **Current Budget**: 15% (from research handoff compaction)
- **Monitoring Strategy**: Update at each checkpoint, compact between phases

### Overall Approach
Implement sliding window rate limiting using Redis sorted sets, with middleware-based architecture that integrates seamlessly with existing Express application structure.

---

## 🚧 Implementation Phases

### Phase 1: Core Rate Limiting Infrastructure
**Estimated Context: 25% | Files: 3**

#### Tasks
- [ ] **Create Rate Limiter Class**: `src/utils/rateLimiter.js` - New file
  - **Why**: Centralized rate limiting logic with sliding window algorithm
  - **What**: Implement RateLimiter class with Redis backend
  - **Test**: Unit tests for rate limit calculations and Redis operations
  - **Validation**: Accurately enforces limits, handles Redis failures gracefully
  - **Context Impact**: +8%

- [ ] **Rate Limiting Middleware**: `src/middleware/rateLimit.js` - New file  
  - **Why**: Express middleware to integrate rate limiting into request pipeline
  - **What**: Middleware function that uses RateLimiter class
  - **Test**: Integration tests with mock Express requests
  - **Validation**: Blocks exceeded requests, allows valid requests, proper headers
  - **Context Impact**: +7%

- [ ] **Configuration Module**: `src/config/rateLimits.js` - New file
  - **Why**: Centralized rate limit configuration per endpoint
  - **What**: Configuration object with per-endpoint and per-user-type limits
  - **Test**: Validate configuration loading and structure
  - **Validation**: All endpoints configured, environment-specific overrides work
  - **Context Impact**: +5%

#### Phase 1 Completion Criteria
- [ ] Rate limiting infrastructure complete and tested
- [ ] Unit tests passing with >95% coverage
- [ ] No dependencies on existing code modified yet
- [ ] Context budget maintained under 25%

---

### Phase 2: API Integration
**Estimated Context: 30% | Files: 2**

#### Tasks
- [ ] **Update Express Router**: `src/routes/api.js:15` - Add middleware integration
  - **Why**: Apply rate limiting to all public API endpoints
  - **What**: Add rate limiting middleware to route definitions
  - **Test**: End-to-end tests with actual API calls
  - **Validation**: All endpoints protected, different limits applied correctly
  - **Context Impact**: +10%
  - **Dependencies**: Phase 1 rate limiting middleware complete

- [ ] **Enhanced Auth Middleware**: `src/middleware/auth.js:45` - Add user tier detection
  - **Why**: Different rate limits for premium vs standard users
  - **What**: Expose user tier information for rate limiting decisions
  - **Test**: Test with different user types and tiers
  - **Validation**: Correct limits applied based on user authentication status
  - **Context Impact**: +8%
  - **Dependencies**: Phase 1 configuration module complete

#### Phase 2 Completion Criteria
- [ ] All API endpoints protected by rate limiting
- [ ] Different limits enforced for user tiers
- [ ] Integration tests passing
- [ ] No breaking changes to existing functionality

---

### Phase 3: Monitoring & Production Readiness
**Estimated Context: 20% | Files: 3**

#### Tasks
- [ ] **Logging & Monitoring**: `src/utils/rateLimitLogger.js` - New file
  - **Why**: Track rate limit violations and abuse patterns
  - **What**: Comprehensive logging with structured data for analysis
  - **Test**: Verify log format and data completeness
  - **Validation**: All events logged, log rotation working, privacy compliant

- [ ] **Admin Endpoints**: `src/routes/admin.js:89` - Add rate limit management
  - **Why**: Runtime visibility and control over rate limiting
  - **What**: Endpoints to view current limits and temporarily adjust
  - **Test**: Test admin authentication and rate limit modifications
  - **Validation**: Secure access, real-time limit updates, audit trail

- [ ] **Load Testing**: `tests/load/rateLimiting.js` - New comprehensive test
  - **Why**: Validate performance under realistic load
  - **What**: Simulate 10,000 requests/minute with rate limit enforcement
  - **Test**: Performance benchmarks and rate limit accuracy under load
  - **Validation**: <5ms latency, accurate limiting, Redis performance stable

#### Phase 3 Completion Criteria
- [ ] All monitoring and admin features complete
- [ ] Load testing passes all performance requirements
- [ ] Production deployment checklist complete
- [ ] Documentation updated for operations team

---

## 🔄 Context Management Strategy

### Context Handoffs
- **After Phase 1**: Compact to infrastructure progress, fresh context for integration
- **After Phase 2**: Compact integration results, fresh context for production readiness
- **After Phase 3**: Final validation and deployment documentation

### Compaction Points
- **Automatic**: When approaching 35% context utilization
- **Manual**: Between phases for optimal fresh start
- **Emergency**: If context becomes unfocused during complex debugging

### Information Preservation
What to carry forward in compacted context:
- [ ] Current implementation status and test results
- [ ] Any deviations from planned approach
- [ ] Performance metrics from each phase
- [ ] Configuration decisions and rationale
- [ ] Outstanding issues requiring attention

---

## ⚠️ Risk Management

### Technical Risks
- **Risk 1**: Redis failure causes rate limiting to fail open
  - **Likelihood**: Medium
  - **Impact**: High (no rate limiting protection)  
  - **Mitigation**: Implement fallback to in-memory limits, Redis monitoring

- **Risk 2**: Rate limiting adds significant latency
  - **Likelihood**: Low
  - **Impact**: High (user experience degradation)
  - **Mitigation**: Performance testing at each phase, Redis optimization

- **Risk 3**: Complex edge cases in sliding window algorithm
  - **Likelihood**: Medium
  - **Impact**: Medium (incorrect rate limiting behavior)
  - **Mitigation**: Comprehensive unit tests, staged rollout with monitoring

### Mitigation Strategies
- **Backup Plan**: Feature flag for disabling rate limiting if critical issues
- **Feature Flags**: Gradual rollout starting with 10% of traffic
- **Monitoring**: Real-time dashboards for rate limiting performance and accuracy
- **Rollback Process**: Automated rollback if error rates exceed 0.1%

---

## 📊 Plan Quality Checklist

- [x] All research requirements addressed in implementation tasks
- [x] Tasks are atomic (completable by single Claude Code session)
- [x] Each task has clear validation criteria and test requirements
- [x] Context budget stays under 40% throughout all phases
- [x] Dependencies between tasks clearly identified and sequenced
- [x] Testing strategy included for every component and integration
- [x] Risk mitigation strategies defined with specific triggers
- [x] Rollback procedures documented for safe deployment

---

## 🎯 Success Mapping

| Research Requirement | Implementation Tasks | Validation Method |
|---------------------|---------------------|-------------------|
| Rate limiting on all endpoints | Phase 2: API integration tasks | End-to-end API tests |
| Different limits per user tier | Phase 2: Auth middleware enhancement | User tier testing |
| <5ms latency impact | Phase 3: Load testing | Performance benchmarks |
| Admin visibility/control | Phase 3: Admin endpoints | Admin functionality tests |
| Audit logging compliance | Phase 3: Logging & monitoring | Log analysis and compliance check |

---
**Plan Status**: Complete
**Context Utilization**: 15%
**Previous Phase**: Research → `01-research.md`
**Next Phase**: Implementation
**Validation Notes**: Plan approved - comprehensive testing strategy and clear phases
```

---

## Phase 3: Implementation

### Command Executed
```bash
/rpi implement start
```

### Implementation Output: `03-progress.md` (Live Updates)

```markdown
# Implementation Progress: API Rate Limiting for User Endpoints
*Generated: 2024-01-15 16:20:15 | Phase: Implementation | Session: rpi-001*
*Executing Plan: `02-plan.md`*

## 📊 Current Status

### Phase Overview
- **Current Phase**: 1/3 (Core Rate Limiting Infrastructure)
- **Overall Progress**: 23%
- **Context Utilization**: 31% ✅ (under 40% target)
- **Session Time**: 1h 15m

### Context Budget Status
- **Target**: < 40% utilization
- **Current**: 31%
- **Trend**: ↑ increasing (implementation complexity)
- **Next Checkpoint**: Phase 1 completion (estimated 35%)

---

## 🔄 Current Phase: Core Rate Limiting Infrastructure - IN PROGRESS

### Active Task
- [ ] **Create Rate Limiter Class** (`src/utils/rateLimiter.js`)
  - **Progress**: 85% complete
  - **Current Status**: Implementing Redis sorted set cleanup logic
  - **Next Step**: Add error handling for Redis connection failures
  - **Context Impact**: +12% (total now 31%)
  - **Started**: 16:20:15
  - **Estimated Completion**: 16:35:00

### Task Details
**What we're doing**: Creating the core RateLimiter class with sliding window algorithm
**Why it matters**: Foundation for all rate limiting functionality
**How we're testing**: Unit tests with Redis mock and real Redis integration tests

### Remaining Tasks in Current Phase
- [ ] **Rate Limiting Middleware** - Express middleware integration
- [ ] **Configuration Module** - Per-endpoint rate limit configuration

---

## ✅ Completed Tasks

### Rate Limiter Class Implementation - 85% COMPLETE
**File**: `src/utils/rateLimiter.js`
**Completed Components**:
- [x] Constructor with Redis client and configuration
- [x] Sliding window algorithm implementation  
- [x] Rate limit checking logic
- [x] Counter increment and window management
- [x] TTL handling for automatic cleanup
- [ ] **In Progress**: Error handling for Redis failures (fallback logic)

**Code Structure Created**:
```javascript
class RateLimiter {
  constructor(redisClient, config) { /* implemented */ }
  async checkLimit(identifier, endpoint) { /* implemented */ }
  async incrementCounter(identifier, endpoint) { /* implemented */ }
  async cleanupExpiredCounters(identifier, endpoint) { /* in progress */ }
  // Error handling methods - next step
}
```

**Tests Added**:
- [x] Unit tests for rate limit calculations (12 tests passing)
- [x] Redis integration tests (8 tests passing) 
- [x] Sliding window accuracy tests (5 tests passing)
- [ ] **Pending**: Error handling test cases

---

## 🎯 Quality Metrics (Real-time)

### Test Status
- **Unit Tests**: 25/27 passing (92.6%)
- **Integration Tests**: 8/8 passing (100%)
- **Coverage**: 89% (target: 95%)

### Performance Metrics
- **Redis Operation Time**: 2.3ms avg (target: <5ms)
- **Memory Usage**: 45MB (well under 100MB target)
- **Error Rate**: 0% (target: <0.1%)

### Code Quality
- **Linting**: ✅ Passing
- **Type Checking**: ✅ Passing (TypeScript definitions added)
- **Security Scan**: ✅ No vulnerabilities

---

## 🚨 Issues & Deviations

### Current Issues
- **No current blockers** ✅

### Plan Deviations
- **Minor Enhancement**: Added TypeScript definitions for better developer experience
  - **Reason**: Team coding standards require type definitions
  - **Impact**: +2% context usage, improved maintainability
  - **Adjustment**: No change to timeline, fits within Phase 1 budget

---

## 🔄 Context Management

### Current Context Breakdown
- **Research Context**: 8% (compacted from 28%)
- **Plan Context**: 6% (compacted from 15%)
- **Implementation Context**: 17%
- **Working Memory**: 0%
- **Total**: 31%

### Next Context Action
- **Status**: Context healthy, continue implementation
- **Next checkpoint**: Phase 1 completion (estimated 35% total context)

---

## 📈 Session Analytics

### Productivity Metrics
- **Tasks Completed**: 0/9 (85% progress on current task)
- **Time per Task**: On track (45min for 85% of complex task)
- **Context Efficiency**: 92% (staying well under limits)
- **Plan Adherence**: 98% (minor TypeScript addition)

### Learning & Insights
- **Key Learnings**: Redis sorted sets more efficient than expected for cleanup
- **Process Improvements**: TypeScript definitions should be planned upfront
- **Team Notes**: Error handling patterns established for Redis operations

---

## 🎯 Next Actions

### Immediate (Next 15 minutes)
1. Complete Redis error handling and fallback logic
2. Add remaining error handling test cases
3. Update coverage to meet 95% target

### Short-term (This session)
1. Complete Rate Limiting Middleware implementation
2. Create Configuration Module
3. Run full Phase 1 test suite

### Medium-term (Next session)
1. Context compaction and Phase 2 handoff
2. Begin API integration tasks
3. Start performance baseline measurements

---
**Implementation Status**: Phase 1 In Progress (85% current task)
**Context Utilization**: 31%
**Previous Phase**: Planning → `02-plan.md`
**Next Milestone**: Phase 1 Completion
**Last Updated**: 16:32:45

---

## 🎉 Phase 1 Completion Update

### PHASE 1 COMPLETE ✅
**Completed**: 2024-01-15 17:15:22

#### Completed Tasks
- [x] **Rate Limiter Class** (`src/utils/rateLimiter.js`)
  - **Result**: Full sliding window implementation with Redis backend
  - **Tests**: 32/32 passing, 96% coverage
  - **Performance**: 2.1ms avg operation time

- [x] **Rate Limiting Middleware** (`src/middleware/rateLimit.js`)
  - **Result**: Express middleware with proper error handling
  - **Tests**: 18/18 passing, integration with Express tested
  - **Performance**: 1.8ms additional request latency

- [x] **Configuration Module** (`src/config/rateLimits.js`)
  - **Result**: Flexible per-endpoint configuration system
  - **Tests**: 8/8 passing, environment override testing
  - **Performance**: <0.1ms configuration lookup time

#### Phase Results
- **Functionality**: ✅ All core infrastructure complete
- **Tests**: ✅ 58/58 tests passing, 96% coverage
- **Performance**: ✅ 3.9ms total latency (under 5ms target)
- **Context Impact**: Used 34% (planned: 25%, acceptable overage)

### Ready for Phase 2: API Integration
**Context Handoff**: Compacting to 12% for fresh start
**Next Session**: Begin API endpoint integration
```

---

## Key Benefits Demonstrated

### 1. **Systematic Progress**
- No "vibe coding" - every step planned and validated
- Clear context management preventing overwhelm
- Measurable progress with specific completion criteria

### 2. **Quality Assurance**
- Research phase caught all critical requirements upfront
- Planning phase identified all technical risks
- Implementation phase maintained quality metrics throughout

### 3. **Context Efficiency**
- Stayed under 40% context utilization target
- Smooth handoffs between phases  
- No context pollution or loss of focus

### 4. **Team Alignment**
- Research document reviewable by business stakeholders
- Plan document reviewable by technical team
- Implementation progress visible to all stakeholders

### 5. **Risk Mitigation**
- All risks identified in planning phase
- Fallback strategies defined before implementation
- No implementation surprises or scope creep

This example shows how the RPI Loop transforms a complex feature implementation from an ad-hoc coding session into a systematic, well-documented, and highly successful development process.